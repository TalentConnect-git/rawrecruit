import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/core/index.dart' show ResultFuture;

import '../revamp_entities/onboarding_model.dart';


abstract class RevampOnboardingRepository {
  ResultFuture<OnboardingData?> getOnboardingUserProfile();

  ResultFuture<OnboardingData?> submitOnboardingUserProfile({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  });

  ResultFuture<OnboardingData?> updateOnboardingUserProfile({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  });
}
