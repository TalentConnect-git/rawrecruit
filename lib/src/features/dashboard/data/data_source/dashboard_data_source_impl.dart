import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/features/alumni/index.dart'
    show CompanyAlumniResponse;
import 'package:rawrecruit/src/features/dashboard/data/data_source/dashbooard_data_source.dart';

import '../../../../core/index.dart';

class DashboardDataSourceImpl implements DashboardDataSource {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<List<Job>> getOffCampusJobs() async {
    final Request request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.apiOffCampusJobs,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      final List data = response['data'] ?? [];

      final jobs = data
          .map((e) {
            try {
              return Job.fromJson(e);
            } catch (err) {
              print("PARSE ERROR: $err");
              return null;
            }
          })
          .whereType<Job>()
          .toList();
      print("FINAL JOBS COUNT: ${jobs.length}");
      return Right(jobs);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<Job>> getReferralJobs() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.referalListing,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final list = (result.data["data"] as List)
          .map((e) => Job.fromJson(e))
          .toList();

      return Right(list);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<Job> getReferralJobDetails(String id) async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: "/jobs/jobDetails/referral/$id",
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final data = (result.data as List).first;

      return Right(Job.fromJson(data));
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<void> applyReferral(String referralId) async {
    final request = Request(
      method: RequestMethod.post,
      endpoint: "/application/candidate/referral",
      body: {"referralId": referralId},
      isSafeRoute: true,
    );

    try {
      await _networkService.request(request);
      return const Right(null);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<Job>> getInternships() async {
    final Request request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.apiInternshipPostings,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      final List data = response['data'] ?? [];

      final internships = data.map((e) => Job.fromJson(e)).toList();

      return Right(internships);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<User>> getCollegeAlumni() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.apiCandidateCollegeAlumni,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final List list = result.data['data'] ?? []; // ✅ IMPORTANT

      final alumniList = list.map((e) => User.fromJson(e)).toList();

      return Right(alumniList);
    } catch (e, s) {
      log('$e\n\n$s');
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<CompanyAlumniResponse> getCompanyAlumni() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.apiCandidateCompanyAlumni,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final response = result.data as Map<String, dynamic>; // ✅ IMPORTANT

      final alumni = CompanyAlumniResponse.fromJson(response);

      return Right(alumni);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<User>> getAlumniByCompany({
    required String companyName,
    required String userId,
  }) async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: "${Endpoints.apiCandidateAlumni}/$companyName/$userId",
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final List list = result.data['data'] ?? []; // ✅ IMPORTANT

      final alumniList = list.map((e) => User.fromJson(e)).toList();

      return Right(alumniList);
    } catch (e, s) {
      log('$e\n\n$s');
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<User>> getHiringAlumni({
    required bool onlyPostedJob,
  }) async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.apiCandidateHiringNetwork,
      queryParams: {
        if (onlyPostedJob) 'jobPostedOnly': onlyPostedJob.toString(),
      },
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final List list = result.data['data'] ?? []; // ✅ IMPORTANT

      final alumniList = list.map((e) => User.fromJson(e)).toList();

      return Right(alumniList);
    } catch (e, s) {
      log('$e\n\n$s');
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<User?> getUserById({required String userId}) async {
    final Request request = Request(
      method: RequestMethod.get,
      endpoint: '${Endpoints.apiOnboardingGetDetails}/$userId',
      isSafeRoute: true,
    );

    try {
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
  ResultFuture<User?> getMessageDetailById({required String userId}) async {
    final Request request = Request(
      method: RequestMethod.get,
      endpoint: '${Endpoints.apiMessagesUser}/$userId',
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final profile = User.fromJson(response);
        return Right(profile);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }
}
