import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/data/revamp_entities/onboarding_model.dart';

abstract class RevampOnboardingDataSource {
  ResultFuture<OnboardingData?> getOnboardingUser();

  ResultFuture<OnboardingData?> submitOnboardingUser({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  });

  ResultFuture<OnboardingData?> updateOnboardingUser({
    required Map<String, dynamic> body,
    File? resume, // ← ADD
    XFile? image,
  });
}
