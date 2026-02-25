import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/data/index.dart';

class MyProfileViewModel extends ViewStateProvider {
  final OnboardingRepository _onboardingRepository =
      getIt<OnboardingRepository>();

  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;
  set userProfile(UserProfile? user) {
    _userProfile = user;
    notifyListeners();
  }

  bool get canEdit => _userProfile != null;

  bool _isEditing = false;
  bool get isEditing => _isEditing;
  set isEditing(bool value) {
    _isEditing = value;
    notifyListeners();
  }

  Future<Failure?> getUserProfile() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _onboardingRepository.getOnboardingUserProfile();

    result.fold(
      (e) {
        failure = APIFailure.fromException(exception: e);
      },
      (r) {
        userProfile = r;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }

  Future<Failure?> updateUserProfile() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _onboardingRepository.updateOnboardingUserProfile(
      body: {},
    );

    result.fold(
      (e) {
        failure = APIFailure.fromException(exception: e);
      },
      (r) {
        userProfile = r;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
}
