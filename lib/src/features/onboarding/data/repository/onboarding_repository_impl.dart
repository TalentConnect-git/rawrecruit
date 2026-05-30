import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/onboarding/data/data_source/index.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show OnboardingRepository;

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
}
