import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/data/entities/user_profile.dart';

abstract class OnboardingDataSource {
  ResultFuture<UserProfile?> getOnboardingUserProfile();

  ResultFuture<UserProfile?> submitOnboardingUserProfile({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  });

  ResultFuture<UserProfile?> updateOnboardingUserProfile({
    required Map<String, dynamic> body,
    File? resume, // ← ADD
    XFile? image,
  });
}
