import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';

import 'application_data_source.dart';

class ApplicationDataSourceImpl implements ApplicationDataSource {
  final NetworkService _networkService = NetworkService();

  /// 🔥 COMMON SAFE MAPPER (MOST IMPORTANT FIX)
  Job _mapToJob(Map<String, dynamic> e, String type) {
    final job = e['jobDetails'];
    final company = e['companyProfile'];

    return Job.fromJson({
      ...(job ?? {}),

      /// 🔥 prevent parsing crash
      "companyPosted": null,
      "jobCompanyPosted": null,
      "candidatePosted": null,
      "contactPerson": null,

      /// ✅ company name safe
      "companyName": company?['companyDetails']?['companyName'] ?? "-",

      /// ✅ status
      "status": e["currentStatus"] ?? "pending",

      /// ✅ VERY IMPORTANT (for filtering)
      "jobType": type,
    });
  }

  /// 🔹 APPLY OFF-CAMPUS
  @override
  ResultFuture<void> applyOffCampus({required String jobId}) async {
    final request = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.applyOffCampus,
      body: {"jobId": jobId},
      isSafeRoute: true,
    );

    try {
      await _networkService.request(request);
      return const Right(null);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  /// 🔹 APPLY REFERRAL
  @override
  ResultFuture<void> applyReferral(
    String referralId,
    int? matchScore,
    String companyName,
  ) async {
    final request = Request(
      method: RequestMethod.post,
      endpoint: "/application/candidate/referral",
      body: {
        "referralId": referralId,
        'matchScore': matchScore,
        'companyName': companyName,
      },
      isSafeRoute: true,
    );

    try {
      await _networkService.request(request);
      return const Right(null);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  /// 🔹 APPLY INTERNSHIP
  @override
  ResultFuture<void> applyInternship(String jobId) async {
    final request = Request(
      method: RequestMethod.post,
      endpoint: "/application/candidate/internship",
      body: {"internshipId": jobId},
      isSafeRoute: true,
    );

    try {
      await _networkService.request(request);
      return const Right(null);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  /// 🔹 FETCH OFF-CAMPUS APPLICATIONS
  @override
  ResultFuture<List<Job>> fetchAppliedJobs() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.applicationStatus,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final body = result.data as Map<String, dynamic>;
      final List data = body['data'];

      final list = data.map((e) => _mapToJob(e, "Off-campus")).toList();

      return Right(list);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  /// 🔹 FETCH REFERRAL APPLICATIONS (FOR STUDENT)
  @override
  ResultFuture<List<Job>> fetchReferralAppliedJobs() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: "application/status/candidate/Referral",
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final List data = result.data['data'];

      final list = data.map((e) => _mapToJob(e, "Referral")).toList();

      return Right(list);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  /// 🔹 FETCH INTERNSHIP APPLICATIONS
  @override
  ResultFuture<List<Job>> fetchInternshipAppliedJobs() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: "application/status/candidate/Internship",
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final List data = result.data['data'];

      final list = data.map((e) => _mapToJob(e, "Internship")).toList();

      return Right(list);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  /// 🔹 FETCH REFERRALS (PROFESSIONAL SIDE)
  @override
  ResultFuture<List<ReferralApplication>> fetchReferralApplications() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: "/application/all-referrals",
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final body = result.data as Map<String, dynamic>;
      final List<dynamic> data = body['data'] as List<dynamic>;

      if (data.isNotEmpty) {
        final list = data.map<ReferralApplication>((e) {
          return ReferralApplication.fromJson(e as Map<String, dynamic>);
        }).toList();

        return Right(list);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right([]);
  }

  /// 🔹 FETCH REFERRED BY ME
  @override
  ResultFuture<List<ReferralApplication>> fetchReferredByMe() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: "/application/referrals/referred-by-me",
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final body = result.data as Map<String, dynamic>;
      final List data = body['data'];

      final list = data.map<ReferralApplication>((e) {
        return ReferralApplication.fromJson(e as Map<String, dynamic>);
      }).toList();

      return Right(list);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<void> updateReferralStatus({
    required String applicationId,
    required String status,
    required String jobRole,
  }) async {
    final request = Request(
      method: RequestMethod.patch,
      endpoint: "/application/referrals/$applicationId/status",
      body: {"status": status, "jobRole": jobRole},
      isSafeRoute: true,
    );

    try {
      await _networkService.request(request);
      return const Right(null);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
