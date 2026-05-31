import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/core/index.dart';

abstract class OnboardingDataSource {
  ResultFuture<User?> getOnboardingUser();

  ResultFuture<User?> submitOnboardingUser({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  });

  ResultFuture<User?> updateOnboardingUser({
    required Map<String, dynamic> body,
    File? resume, // ← ADD
    XFile? image,
  });

  ResultFuture<Map<String, dynamic>> getCareerInsights();
  ResultFuture<Map<String, dynamic>> getRanking();
  ResultFuture<Map<String, dynamic>> getReferralMetrics();
  ResultFuture<List<Map<String, dynamic>>> getColleges();

  ResultFuture<Map<String, dynamic>> registerCollege({required String name});

  ResultFuture<List<Map<String, dynamic>>> getDegrees();

  ResultFuture<List<Map<String, dynamic>>> getStreams({
    required String degreeId,
  });
  ResultFuture<Map<String, dynamic>> createMasterData({
    required String type,
    required String value,
    String? parent,
  });
}
