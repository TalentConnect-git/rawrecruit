import 'dart:developer';

import 'package:rawrecruit/src/core/index.dart'
    show
        User,
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
    show OnboardingRepository;

import '../network/socket_service.dart';

class AppStateProvider extends ViewStateProvider {
  String get userEmail => auth?.email ?? '';
  String get userId => auth?.id ?? '';
  UserType? get userType => auth?.userType;

  bool get isProfessional => userType == UserType.professional;

  Auth? _auth;
  UserType? _selectedUserType;
  UserType? get selectedUserType => _selectedUserType;

  set selectedUserType(UserType? type) {
    _selectedUserType = type;
    notifyListeners();
  }

  Auth? get auth => _auth;
  set auth(Auth? auth) {
    _auth = auth;
    if (auth != null && auth.id != null) {
      SocketService().connect(auth.id!);
    }

    notifyListeners();
  }

  User? _user;
  User? get user => _user;
  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  User? _onboardingData;
  User? get data => _onboardingData;
  set data(User? data) {
    _onboardingData = data;
    notifyListeners();
  }

  List<String> _shortlistSchools = [];
  List<String> get shortlistSchools => _shortlistSchools;
  set shortlistSchools(List<String> values) {
    _shortlistSchools = values;
    notifyListeners();
  }

  bool get isProfileComplete => user != null;
  //&& (user?.onboardingCompleted ?? false)
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

    final result = await getIt<OnboardingRepository>().getOnboardingUser();

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
