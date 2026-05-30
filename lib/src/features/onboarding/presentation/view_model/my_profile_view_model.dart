import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/data/index.dart';

class MyProfileViewModel extends ViewStateProvider {
  final OnboardingRepository _onboardingRepository =
      getIt<OnboardingRepository>();

  User? _user;
  User? get user => _user;
  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  bool get isProfileAvailable =>
      user?.profileImage != null && (user?.profileImage?.isNotEmpty ?? false);

  bool get canEdit => _user != null;

  bool _isEditing = false;
  bool get isEditing => _isEditing;
  set isEditing(bool value) {
    _isEditing = value;
    notifyListeners();
  }

  Future<Failure?> getUser() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _onboardingRepository.getOnboardingUser();

    result.fold(
      (e) {
        failure = APIFailure.fromException(exception: e);
      },
      (r) {
        user = r;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }

  Future<Failure?> updateUser() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _onboardingRepository.updateOnboardingUser(body: {});

    result.fold(
      (e) {
        failure = APIFailure.fromException(exception: e);
      },
      (r) {
        user = r;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
}
