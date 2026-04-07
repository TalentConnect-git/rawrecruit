import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rawrecruit/src/core/index.dart'
    show
        APIException,
        AppStateProvider,
        Endpoints,
        NetworkService,
        Request,
        RequestMethod,
        ResultFuture,
        User,
        getIt;

import 'revamp_on_boarding_data_source.dart';

class RevampOnboardingDataSourceImpl implements RevampOnboardingDataSource {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<User?> submitOnboardingUser({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
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
        if (image != null)
          'profileImage': await MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
          ),
      });

      final Request request = Request(
        method: RequestMethod.post,
        endpoint: Endpoints.apiOnboarding,
        isSafeRoute: true,
        formData: formData, // ← FormData, not body
      );

      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final profile = User.fromJson(response['onboarding']);
        return Right(profile);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }

  @override
  ResultFuture<User?> updateOnboardingUser({
    required Map<String, dynamic> body,
    File? resume, // ← ADD
    XFile? image,
  }) async {
    try {
      final formData = FormData.fromMap({
        ...body,
        if (image != null)
          'profileImage': await MultipartFile.fromFile(
            image.path,
            filename: image.path.split('/').last,
          ),
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
        formData: formData, // ← FormData instead of body
      );

      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final profile = User.fromJson(response['data']);
        return Right(profile);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }

  @override
  ResultFuture<User?> getOnboardingUser() async {
    final Request request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.apiOnboardingMe,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final profile = User.fromJson(response);
        getIt<AppStateProvider>().data = profile;
        return Right(profile);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }
}
