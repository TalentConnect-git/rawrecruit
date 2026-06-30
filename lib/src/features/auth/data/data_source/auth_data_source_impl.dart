import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rawrecruit/src/config/index.dart';
import 'package:rawrecruit/src/core/index.dart';

import 'auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final NetworkService _networkService = NetworkService();
  @override
  ResultFuture<Auth?> login({
    required String email,
    required String password,
  }) async {
    final deviceToken = SharedPrefHelper.getString("deviceToken");

    final Request request = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.apiAuthLogin,
      body: {'email': email, 'password': password, 'deviceToken': deviceToken},
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final auth = Auth.fromJson(response['user']);
        await SecretRepo.setString('auth_token', response['token']);
        await SecretRepo.setString('auth_id', auth.id ?? '');

        final loginToken = await SecretRepo.getString('auth_token');

        log(loginToken ?? '', name: 'Login token');
        return Right(auth);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }

  @override
  ResultFuture<Auth?> register({
    required String email,
    required String password,
    required UserType userType,
    required String otp,
  }) async {
    final deviceToken = SharedPrefHelper.getString("deviceToken");

    final Request request = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.apiAuthSignup,
      body: {
        'email': email,
        'password': password,
        'userType': userType.apiLabel,
        'otp': otp,
        'deviceToken': deviceToken,
      },
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final auth = Auth.fromJson(response['user']);
        await SecretRepo.setString('auth_token', response['token']);
        await SecretRepo.setString('auth_id', auth.id ?? '');
        return Right(auth);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }

  @override
  ResultFuture<String?> sendOtp({required String email}) async {
    final Request request = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.apiAuthSendOtp,
      body: {'email': email},
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        bool isSuccess = response['success'] ?? false;
        return isSuccess
            ? Right(response['msg'])
            : Left(
                APIException(message: 'Internal Server Error', statusCode: 500),
              );
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }

  @override
  ResultFuture<Auth?> getAuth() async {
    final Request request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.apiAuthMe,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final auth = Auth.fromJson(response['user']);
        return Right(auth);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }

  @override
  ResultFuture<String?> logout() async {
    final Request request = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.apiAuthLogout,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        return Right(response['message']);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }

  @override
  ResultFuture<Auth?> googleLogin({required UserType? userType}) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.initialize(
        serverClientId: getServerClientId(FlavorConfig.instance.flavor),
      );

      try {
        await googleSignIn.signOut();
      } catch (_) {}

      final GoogleSignInAccount googleUser = await googleSignIn.authenticate(
        scopeHint: ['email'],
      );
      //
      // final authorization = await googleUser.authorizationClient
      //     .authorizeServer(const <String>['email', 'profile']);
      //
      // final String? serverAuthCode = authorization?.serverAuthCode;

      final authentication = googleUser.authentication;

      final idToken = authentication.idToken;

      if (idToken == null) {
        return Left(
          APIException(
            message: 'Something went wrong, Try again later.',
            statusCode: 500,
          ),
        );
      }

      final deviceToken = SharedPrefHelper.getString("deviceToken");

      final request = Request(
        method: RequestMethod.post,
        endpoint: Endpoints.apiAuthGoogle,
        body: {
          'googleToken': idToken, //serverAuthCode,
          if (userType != null) 'userType': userType.apiLabel,
          'deviceToken': deviceToken,
          'isApp': true,
        },
      );

      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final auth = Auth.fromJson(response['user']);
        await SecretRepo.setString('auth_token', response['token']);
        await SecretRepo.setString('auth_id', auth.id ?? '');
        return Right(auth);
      }
    } on GoogleSignInException catch (e, s) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        log('Error: $e\n\n$s');
        return Left(
          APIException(message: 'Sign in aborted by user', statusCode: 499),
        );
      }
      return Left(
        APIException(
          message: e.description ?? 'Google sign in failed',
          statusCode: 500,
        ),
      );
    }

    return Right(null);
  }

  @override
  ResultFuture<Auth?> loginWithLinkedIn({required String userType}) async {
    try {
      final url =
          '${FlavorConfig.instance.baseMobileUrl}${Endpoints.apiAuthLinkedIn}?userType=$userType';

      // Launch OAuth flow
      final callbackUrl = await FlutterWebAuth2.authenticate(
        url: url,
        callbackUrlScheme: 'myapp',
      );

      final uri = Uri.parse(callbackUrl);

      final error = uri.queryParameters['error'];

      if (error != null) {
        return Left(APIException(message: error, statusCode: 400));
      }

      final token = uri.queryParameters['token'];

      if (token == null) {
        return Left(APIException(message: 'Token not found', statusCode: 400));
      }

      final auth = Auth(
        id: uri.queryParameters['userId'],
        email: uri.queryParameters['email'],
        name: uri.queryParameters['name'],
        userType: UserTypeExt.fromValue(uri.queryParameters['userType'] ?? ''),
        profileImage: uri.queryParameters['profileImage'],
        onboardingCompleted:
            uri.queryParameters['onboardingCompleted'] == 'true',
      );

      await SecretRepo.setString('auth_token', token);
      await SecretRepo.setString('auth_id', auth.id ?? '');

      return Right(auth);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<String?> forgotPassword({required String email}) async {
    final Request request = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.apiAuthForgotPassword,
      body: {'email': email},
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        return Right(response['message']);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }
}
