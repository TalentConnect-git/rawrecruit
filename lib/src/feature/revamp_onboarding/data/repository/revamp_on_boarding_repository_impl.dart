import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/core/index.dart';

import '../data_source/revamp_on_boarding_data_source.dart';
import 'index.dart';

class RevampOnboardingRepositoryImpl implements RevampOnboardingRepository {
  const RevampOnboardingRepositoryImpl({
    required RevampOnboardingDataSource onboardingDataSource,
  }) : _onboardingDataSource = onboardingDataSource;

  final RevampOnboardingDataSource _onboardingDataSource;

  @override
  ResultFuture<User?> getOnboardingUser() =>
      _onboardingDataSource.getOnboardingUser();

  @override
  ResultFuture<User?> submitOnboardingUser({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  }) => _onboardingDataSource.submitOnboardingUser(
    body: body,
    resume: resume,
    image: image,
  );
  @override
  ResultFuture<User?> updateOnboardingUser({
    required Map<String, dynamic> body,
    File? resume, // ← ADD
    XFile? image,
  }) => _onboardingDataSource.updateOnboardingUser(
    body: body,
    resume: resume, // ← ADD
    image: image,
  );

    @override
  ResultFuture<Map<String, dynamic>> getCareerInsights() =>
      _onboardingDataSource.getCareerInsights();

  @override
  ResultFuture<Map<String, dynamic>> getRanking() =>
      _onboardingDataSource.getRanking();

      @override
ResultFuture<Map<String, dynamic>> getReferralMetrics() =>
    _onboardingDataSource.getReferralMetrics();
}
