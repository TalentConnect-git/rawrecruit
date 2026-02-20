import 'dart:io';

import 'package:rawrecruit/src/core/network/typedef.dart';
import 'package:rawrecruit/src/features/onboarding/data/data_source/index.dart';
import 'package:rawrecruit/src/features/onboarding/data/entities/user_profile.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show OnboardingRepository;

class OnboardingRepositoryImpl implements OnboardingRepository {
  const OnboardingRepositoryImpl({
    required OnboardingDataSource onboardingDataSource,
  }) : _onboardingDataSource = onboardingDataSource;

  final OnboardingDataSource _onboardingDataSource;

  @override
  ResultFuture<UserProfile?> getOnboardingUserProfile() =>
      _onboardingDataSource.getOnboardingUserProfile();

  @override
  ResultFuture<UserProfile?> submitOnboardingUserProfile({
    required Map<String, dynamic> body,
    File? resume,
  }) => _onboardingDataSource.submitOnboardingUserProfile(
    body: body,
    resume: resume,
  );

  @override
  ResultFuture<UserProfile?> updateOnboardingUserProfile({
    required Map<String, dynamic> body,
  }) => _onboardingDataSource.updateOnboardingUserProfile(body: body);
}
