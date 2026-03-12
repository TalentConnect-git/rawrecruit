import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rawrecruit/src/core/index.dart'
    show
        Request,
        ResultFuture,
        RequestMethod,
        Endpoints,
        APIException,
        getIt,
        NetworkService,
        AppStateProvider;
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show OnboardingDataSource, UserProfile;

class OnboardingDataSourceImpl implements OnboardingDataSource {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<UserProfile?> getOnboardingUserProfile() async {
    final Request request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.apiOnboardingMe,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final profile = UserProfile.fromJson(response);
        getIt<AppStateProvider>().user = profile;
        return Right(profile);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }

  @override
  ResultFuture<UserProfile?> submitOnboardingUserProfile({
    required Map<String, dynamic> body,
    File? resume,
  }) async {
    try {
      // Build multipart form — file goes under key 'resume'
      final formData = FormData.fromMap({
        ...body,
        if (resume != null)
          'resume': await MultipartFile.fromFile(
            resume.path,
            filename: resume.path.split('/').last,
          ),
      });

      final Request request = Request(
        method: RequestMethod.post,
        endpoint: Endpoints.apiOnboarding,
        isSafeRoute: true,
        formData: formData,   // ← FormData, not body
      );

      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final profile = UserProfile.fromJson(response['onboarding']);
        return Right(profile);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }

@override
ResultFuture<UserProfile?> updateOnboardingUserProfile({
  required Map<String, dynamic> body,
  File? resume,        // ← ADD
}) async {
  try {
    final formData = FormData.fromMap({
      ...body,
      if (resume != null)
        'resume': await MultipartFile.fromFile(
          resume.path,
          filename: resume.path.split('/').last,
        ),
    });

    final Request request = Request(
      method: RequestMethod.put,
      endpoint: Endpoints.apiOnboardingUpdate,
      isSafeRoute: true,
      formData: formData,    // ← FormData instead of body
    );

    final result = await _networkService.request(request);
    final response = result.data as Map<String, dynamic>;

    if (response.isNotEmpty) {
      final profile = UserProfile.fromJson(response['data']);
      return Right(profile);
    }
  } catch (e) {
    return Left(APIException.from(e));
  }

  return Right(null);
}
}
