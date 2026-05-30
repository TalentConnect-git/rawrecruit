import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/core/index.dart' show ResultFuture, User;

abstract class OnboardingRepository {
  ResultFuture<User?> getOnboardingUser();

  ResultFuture<User?> submitOnboardingUser({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  });

  ResultFuture<User?> updateOnboardingUser({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  });
}
