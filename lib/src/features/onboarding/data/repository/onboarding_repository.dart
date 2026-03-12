import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/core/index.dart' show ResultFuture;
import 'package:rawrecruit/src/features/onboarding/index.dart' show UserProfile;

abstract class OnboardingRepository {
  ResultFuture<UserProfile?> getOnboardingUserProfile();

  ResultFuture<UserProfile?> submitOnboardingUserProfile({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  });

  ResultFuture<UserProfile?> updateOnboardingUserProfile({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  });
}
