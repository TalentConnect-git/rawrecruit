import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/auth/index.dart';

class FirstStepViewModel extends ViewStateProvider {
  final _authRepository = getIt<AuthRepository>();

  Future<Failure?> google({required UserType userType}) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _authRepository.googleLogin(userType: userType);

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) async {
        getIt<AppStateProvider>().auth = res;
        getIt<AppStateProvider>().data = User(email: res?.email);
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
}
