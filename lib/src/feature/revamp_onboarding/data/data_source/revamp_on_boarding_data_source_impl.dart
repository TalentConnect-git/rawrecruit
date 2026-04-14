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

  /// 🔥 COMMON FORM BUILDER (reusable)
  Future<FormData> _buildFormData({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  }) async {
    final Map<String, dynamic> formMap = {};

    /// ✅ Handle all fields
    body.forEach((key, value) {
      if (value is List) {
        for (int i = 0; i < value.length; i++) {
          formMap['$key[$i]'] = value[i];
        }
      } else if (value != null && value.toString().isNotEmpty) {
        formMap[key] = value;
      }
    });

    /// ✅ Attach files
    if (resume != null) {
      formMap['resume'] = await MultipartFile.fromFile(
        resume.path,
        filename: resume.path.split('/').last,
      );
    }

    if (image != null) {
      formMap['profileImage'] = await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      );
    }

    return FormData.fromMap(formMap);
  }

  @override
  ResultFuture<User?> submitOnboardingUser({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  }) async {
    try {
      final formData = await _buildFormData(
        body: body,
        resume: resume,
        image: image,
      );

      final Request request = Request(
        method: RequestMethod.post,
        endpoint: Endpoints.apiOnboarding,
        isSafeRoute: true,
        formData: formData,
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
    File? resume,
    XFile? image,
  }) async {
    try {
      final formData = await _buildFormData(
        body: body,
        resume: resume,
        image: image,
      );

      final Request request = Request(
        method: RequestMethod.put,
        endpoint: Endpoints.apiOnboardingUpdate,
        isSafeRoute: true,
        formData: formData,
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
  
    @override
  ResultFuture<Map<String, dynamic>> getCareerInsights() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.careerInsights,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      return Right(result.data['data']);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<Map<String, dynamic>> getRanking() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.careerRanking,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      return Right(result.data['data']);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
ResultFuture<Map<String, dynamic>> getReferralMetrics() async {
  final request = Request(
    method: RequestMethod.get,
    endpoint: "/application/professional/referral-metrics",
    isSafeRoute: true,
  );

  try {
    final result = await _networkService.request(request);
    return Right(result.data['data']);
  } catch (e) {
    return Left(APIException.from(e));
  }
}
}