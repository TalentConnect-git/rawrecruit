import 'dart:io';

import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/data/entities/user_profile.dart';

abstract class OnboardingDataSource {
  ResultFuture<UserProfile?> getOnboardingUserProfile();

  ResultFuture<UserProfile?> submitOnboardingUserProfile({
    required Map<String, dynamic> body,
    File? resume,
  });

  ResultFuture<UserProfile?> updateOnboardingUserProfile({
    required Map<String, dynamic> body,
  });
}
