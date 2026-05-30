import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_auth/data/repository/index.dart';

class ForgotPasswordViewModel extends ViewStateProvider {
  final _authRepository = getIt<RevampAuthRepository>();

  Future<Failure?> sendResetLink({required String email}) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _authRepository.forgotPassword(email: email);

    result.fold((exception) {
      failure = APIFailure.fromException(exception: exception);
    }, (res) async {});

    setViewState(ViewState.complete);

    return failure;
  }
}
