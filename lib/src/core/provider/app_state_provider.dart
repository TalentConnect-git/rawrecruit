import 'package:rawrecruit/src/core/index.dart'
    show Auth, ViewStateProvider, Failure, ViewState, getIt, APIFailure;
import 'package:rawrecruit/src/features/auth/index.dart' show AuthDataSource;

class AppStateProvider extends ViewStateProvider {
  String get userEmail => auth?.email ?? '';

  Auth? _auth;
  Auth? get auth => _auth;
  set auth(Auth? auth) {
    _auth = auth;
    notifyListeners();
  }

  List<String> _shortlistSchools = [];
  List<String> get shortlistSchools => _shortlistSchools;
  set shortlistSchools(List<String> values) {
    _shortlistSchools = values;
    notifyListeners();
  }

  bool get isProfileComplete => auth?.onboardingCompleted ?? false;

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
}
