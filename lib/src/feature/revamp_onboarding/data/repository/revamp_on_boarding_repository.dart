import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/core/index.dart' show ResultFuture;

import '../revamp_entities/onboarding_model.dart';

abstract class RevampOnboardingRepository {
  ResultFuture<OnboardingData?> getOnboardingUser();

  ResultFuture<OnboardingData?> submitOnboardingUser({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  });

  ResultFuture<OnboardingData?> updateOnboardingUser({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  });
}
