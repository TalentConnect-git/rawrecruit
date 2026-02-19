import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/auth/data/data_source/auth_data_source.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required AuthDataSource authDataSource})
    : _authDataSource = authDataSource;

  final AuthDataSource _authDataSource;

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
    required int otp,
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
}
