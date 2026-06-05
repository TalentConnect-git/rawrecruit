import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/core/index.dart';

import '../data_source/on_boarding_data_source.dart';
import 'index.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  const OnboardingRepositoryImpl({
    required OnboardingDataSource onboardingDataSource,
  }) : _onboardingDataSource = onboardingDataSource;

  final OnboardingDataSource _onboardingDataSource;

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

  @override
  ResultFuture<List<Map<String, dynamic>>> getColleges() =>
      _onboardingDataSource.getColleges();

  @override
  ResultFuture<Map<String, dynamic>> registerCollege({required String name}) =>
      _onboardingDataSource.registerCollege(name: name);

  @override
  ResultFuture<List<Map<String, dynamic>>> getDegrees() =>
      _onboardingDataSource.getDegrees();

  @override
  ResultFuture<List<Map<String, dynamic>>> getStreams({
    required String degreeId,
  }) => _onboardingDataSource.getStreams(degreeId: degreeId);

  @override
  ResultFuture<Map<String, dynamic>> createMasterData({
    required String type,
    required String value,
    String? parent,
  }) => _onboardingDataSource.createMasterData(
    type: type,
    value: value,
    parent: parent,
  );
}
