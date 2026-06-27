import 'package:rawrecruit/src/core/index.dart';

abstract class AuthDataSource {
  ResultFuture<Auth?> getAuth();

  ResultFuture<String?> sendOtp({required String email});

  ResultFuture<Auth?> register({
    required String email,
    required String password,
    required UserType userType,
    required String otp,
  });

  ResultFuture<Auth?> login({required String email, required String password});

  ResultFuture<String?> logout();

  ResultFuture<Auth?> googleLogin({required UserType? userType});

  ResultFuture<Auth?> loginWithLinkedIn({required String userType});

  ResultFuture<String?> forgotPassword({required String email});
}
