import 'dart:convert';
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

  Future<FormData> _buildFormData({
    required Map<String, dynamic> body,
    File? resume,
    XFile? image,
  }) async {
    final Map<String, dynamic> formMap = {};

    body.forEach((key, value) {
      if (value is List) {
        if (value.isEmpty) return;

        /// ✅ Nested objects (List<Map>)
        if (value.first is Map) {
          final cleanedList = value
              .map((e) {
                final map = Map<String, dynamic>.from(e);

                map.removeWhere(
                  (k, v) => v == null || v.toString().trim().isEmpty,
                );

                return map;
              })
              .where((e) => e.isNotEmpty)
              .toList();

          if (cleanedList.isNotEmpty) {
            formMap[key] = jsonEncode(cleanedList);
          }
        }
        /// ✅ Simple list (List<String>)
        else {
          final cleanedList = value
              .map((e) => e.toString().trim())
              .where((e) => e.isNotEmpty)
              .toList();

          if (cleanedList.isNotEmpty) {
            formMap[key] = jsonEncode(cleanedList); // 🔥 FIX
          }
        }
      }
      /// ✅ Normal fields
      else if (value != null && value.toString().isNotEmpty) {
        formMap[key] = value.toString();
      }
    });

    /// ✅ Files
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

  @override
  ResultFuture<List<Map<String, dynamic>>> getColleges() async {
    try {
      final request = Request(
        method: RequestMethod.get,
        endpoint: "api/colleges/all",
        isSafeRoute: true,
      );

      final result = await _networkService.request(request);

      final data = List<Map<String, dynamic>>.from(result.data);

      return Right(data);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<Map<String, dynamic>> registerCollege({
    required String name,
  }) async {
    try {
      final request = Request(
        method: RequestMethod.post,
        endpoint: "api/colleges/register",
        isSafeRoute: true,
        body: {"name": name},
      );

      final result = await _networkService.request(request);

      return Right(Map<String, dynamic>.from(result.data));
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<Map<String, dynamic>>> getDegrees() async {
    try {
      final request = Request(
        method: RequestMethod.get,
        endpoint: "api/master-data?type=DEGREE",
        isSafeRoute: true,
      );

      final res = await _networkService.request(request);

      return Right(List<Map<String, dynamic>>.from(res.data['data']));
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<Map<String, dynamic>> createMasterData({
    required String type,
    required String value,
    String? parent,
  }) async {
    try {
      final request = Request(
        method: RequestMethod.post,

        endpoint: "api/master-data",

        isSafeRoute: true,

        body: {
          "type": type,
          "value": value,

          if (parent != null) "parent": parent,
        },
      );

      final res = await _networkService.request(request);

      return Right(Map<String, dynamic>.from(res.data['data']));
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<Map<String, dynamic>>> getStreams({
    required String degreeId,
  }) async {
    try {
      final request = Request(
        method: RequestMethod.get,
        endpoint: "api/master-data?type=STREAM&parent=$degreeId",
        isSafeRoute: true,
      );

      final res = await _networkService.request(request);

      return Right(List<Map<String, dynamic>>.from(res.data['data']));
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
