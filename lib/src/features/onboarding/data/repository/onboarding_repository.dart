import 'dart:io';

import 'package:rawrecruit/src/core/index.dart' show ResultFuture;
import 'package:rawrecruit/src/features/onboarding/index.dart' show UserProfile;

abstract class OnboardingRepository {
  ResultFuture<UserProfile?> getOnboardingUserProfile();

  ResultFuture<UserProfile?> submitOnboardingUserProfile({
    required Map<String, dynamic> body,
    File? resume,
  });

  ResultFuture<UserProfile?> updateOnboardingUserProfile({
    required Map<String, dynamic> body,
  });
}
