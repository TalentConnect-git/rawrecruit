import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/core/network/typedef.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/data/revamp_entities/onboarding_model.dart';


import '../data_source/revamp_on_boarding_data_source.dart';
import 'index.dart';

class RevampOnboardingRepositoryImpl implements RevampOnboardingRepository {
  const RevampOnboardingRepositoryImpl({
    required RevampOnboardingDataSource onboardingDataSource,
  }) : _onboardingDataSource = onboardingDataSource;

  final RevampOnboardingDataSource _onboardingDataSource;

  @override
  ResultFuture<OnboardingData?> getOnboardingUserProfile() =>
      _onboardingDataSource.getOnboardingUserProfile();

  @override
  ResultFuture<OnboardingData?> submitOnboardingUserProfile({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  }) => _onboardingDataSource.submitOnboardingUserProfile(
    body: body,
    resume: resume,
    image: image,
  );
  @override
  ResultFuture<OnboardingData?> updateOnboardingUserProfile({
    required Map<String, dynamic> body,
    File? resume, // ← ADD
    XFile? image,
  }) => _onboardingDataSource.updateOnboardingUserProfile(
    body: body,
    resume: resume, // ← ADD
    image: image,
  );
}
