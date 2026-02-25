import 'dart:developer';

import 'package:rawrecruit/src/core/index.dart'
    show
        Auth,
        ViewStateProvider,
        Failure,
        ViewState,
        getIt,
        APIFailure,
        SecretRepo,
        UserType;
import 'package:rawrecruit/src/features/auth/index.dart' show AuthDataSource;
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show OnboardingRepository, UserProfile;

class AppStateProvider extends ViewStateProvider {
  String get userEmail => auth?.email ?? '';

  UserType? get userType => auth?.userType;

  bool get isProfessional => userType == UserType.professional;

  Auth? _auth;
  Auth? get auth => _auth;
  set auth(Auth? auth) {
    _auth = auth;
    notifyListeners();
  }

  UserProfile? _user;
  UserProfile? get user => _user;
  set user(UserProfile? user) {
    _user = user;
    notifyListeners();
  }

  List<String> _shortlistSchools = [];
  List<String> get shortlistSchools => _shortlistSchools;
  set shortlistSchools(List<String> values) {
    _shortlistSchools = values;
    notifyListeners();
  }

  bool get isProfileComplete => user != null;

  bool get isAuthComplete => auth != null;

  bool get isProfileRemaining => !isProfileComplete;

  bool isSaved(String? jobId) {
    for (String job in shortlistSchools) {
      if (job == jobId) {
        return true;
      }
    }

    return false;
  }

  Future<Failure?> getAuthDetails() async {
    setViewState(ViewState.busy);

    Failure? failure;
    final result = await getIt<AuthDataSource>().getAuth();

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) {
        auth = res;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }

  Future<Failure?> getUserDetails() async {
    setViewState(ViewState.busy);

    Failure? failure;

    final token = await SecretRepo.getString('auth_token');
    log(token ?? '', name: 'OnboardingToken');

    final result = await getIt<OnboardingRepository>()
        .getOnboardingUserProfile();

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) {
        user = res;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }

  Future<Failure?> logout() async {
    setViewState(ViewState.busy);

    Failure? failure;
    final result = await getIt<AuthDataSource>().logout();

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) async {
        await SecretRepo.clearAll();

        final token = await SecretRepo.getString('auth_token');
        log(token ?? '', name: 'token');

        user = null;
        auth = null;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
}
