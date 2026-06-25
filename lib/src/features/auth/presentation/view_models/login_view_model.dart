import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/auth/index.dart' show AuthRepository;

class LoginViewModel extends ViewStateProvider {
  final _authRepository = getIt<AuthRepository>();

  Future<Failure?> login({
    required String email,
    required String password,
  }) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _authRepository.login(
      email: email,
      password: password,
    );

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) async {
        getIt<AppStateProvider>().auth = res;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }

  Future<Failure?> google() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _authRepository.googleLogin(userType: null);

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) async {
        getIt<AppStateProvider>().auth = res;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
}
