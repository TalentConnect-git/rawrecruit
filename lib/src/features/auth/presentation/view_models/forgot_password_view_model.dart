import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/auth/index.dart' show AuthRepository;

class ForgotPasswordViewModel extends ViewStateProvider {
  final _authRepository = getIt<AuthRepository>();

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
