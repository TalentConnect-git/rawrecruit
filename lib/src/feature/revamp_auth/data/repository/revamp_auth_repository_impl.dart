import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rawrecruit/src/core/index.dart';

import '../data_source/index.dart';
import 'revamp_auth_repository.dart';

class RevampAuthRepositoryImpl implements RevampAuthRepository {
  RevampAuthRepositoryImpl({required RevampAuthDataSource authDataSource})
    : _authDataSource = authDataSource;

  final RevampAuthDataSource _authDataSource;

  @override
  ResultFuture<Auth?> login({
    required String email,
    required String password,
  }) => _authDataSource.login(email: email, password: password);

  @override
  ResultFuture<Auth?> register({
    required String email,
    required String password,
    required UserType userType,
    required String otp,
  }) => _authDataSource.register(
    email: email,
    password: password,
    userType: userType,
    otp: otp,
  );

  @override
  ResultFuture<String?> sendOtp({required String email}) =>
      _authDataSource.sendOtp(email: email);

  @override
  ResultFuture<Auth?> getAuth() => _authDataSource.getAuth();

  @override
  ResultFuture<String?> logout() => _authDataSource.logout();

  @override
  ResultFuture<Auth?> googleLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn.instance;

    await googleSignIn.signOut();
    await googleSignIn.disconnect();

    await googleSignIn.initialize(
      serverClientId:
          '532797617580-jd8i8njg4kub2fkrp5qr4ha1395db36d.apps.googleusercontent.com',
    );

    final GoogleSignInAccount? googleUser = await googleSignIn.authenticate(
      scopeHint: ['email'],
    );

    if (googleUser == null) {
      return Left(
        APIException(message: 'Sign in aborted by user', statusCode: 500),
      );
    }

    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final idToken = googleAuth.idToken;

    if (idToken == null) {
      return Left(
        APIException(
          message: 'Something went wrong, Try again later.',
          statusCode: 500,
        ),
      );
    }

    final auth = await _authDataSource.googleLogin(token: idToken);

    return auth;
  }
}
