import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/auth/index.dart' show AuthRepository;

class RegisterViewModel extends ViewStateProvider {
  final _authRepository = getIt<AuthRepository>();

  bool _isOtpSent = false;
  bool get isOtpSent => _isOtpSent;
  set isOtpSent(bool value) {
    _isOtpSent = value;
    notifyListeners();
  }

  bool _isLoadingForOtp = false;
  bool get isLoadingForOtp => _isLoadingForOtp;
  set isLoadingForOtp(bool value) {
    _isLoadingForOtp = value;
    notifyListeners();
  }

  Future<Failure?> sendOtp({required String email}) async {
    Failure? failure;

    isLoadingForOtp = true;

    final result = await _authRepository.sendOtp(email: email);

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) async {
        isOtpSent = true;
      },
    );

    isLoadingForOtp = false;

    return failure;
  }

  Future<Failure?> register({
    required String email,
    required String password,
    required String otp,
  }) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _authRepository.register(
      email: email,
      password: password,

      /// 🔥 USE STORED TYPE
      userType: getIt<AppStateProvider>().selectedUserType!,

      otp: otp,
    );

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) async {
        getIt<AppStateProvider>().auth = res?.copyWith(email: email);
        print(res);
        print(res?.email);

        /// ✅ OPTIONAL CLEANUP
        getIt<AppStateProvider>().selectedUserType = null;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }

  Future<Failure?> googleLogin() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _authRepository.googleLogin(
      userType: getIt<AppStateProvider>().selectedUserType!,
    );

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) async {
        getIt<AppStateProvider>().auth = res;
        getIt<AppStateProvider>().selectedUserType = null;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
}
