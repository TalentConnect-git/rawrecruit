import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/data/data_source/dashbooard_data_source.dart';

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
      endpoint: "/api/candidate/college-alumni",
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final List list = result.data['alumni'] ?? []; // ✅ IMPORTANT

      final alumniList = list.map((e) => User.fromJson(e)).toList();

      return Right(alumniList);
    } catch (e, s) {
      log('$e\n\n$s');
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<Job>> getCompanyAlumni() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: "/api/candidate/college-alumni",
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final List list = result.data['jobs'] ?? []; // ✅ IMPORTANT

      final alumniList = list.map((e) => Job.fromJson(e)).toList();

      return Right(alumniList);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
