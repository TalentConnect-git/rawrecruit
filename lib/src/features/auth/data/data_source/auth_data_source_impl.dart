import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/core/index.dart';

import 'auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<Auth?> login({
    required String email,
    required String password,
  }) async {
    final Request request = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.apiAuthLogin,
      body: {'email': email, 'password': password},
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
  ResultFuture<Auth?> register({
    required String email,
    required String password,
    required UserType userType,
    required int otp,
  }) async {
    final Request request = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.apiAuthSignup,
      body: {
        'email': email,
        'password': password,
        'userType': userType.label,
        'otp': otp.toString(),
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
        return Right(response['user']);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }
}
