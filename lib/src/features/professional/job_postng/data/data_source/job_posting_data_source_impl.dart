import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';

import '../../../../../core/index.dart';
import '../../presentation/entities/referral_post_model.dart';
import 'job_posting_data_source.dart';

class ReferralPostDataSourceImpl implements ReferralPostDataSource {
  final NetworkService _networkService = getIt<NetworkService>();
  @override
  ResultFuture<void> postReferralJob(ReferralPostModel model) async {
    final body = model.toJson();

    body.remove('_id');

    final request = Request(
      method: RequestMethod.post,
      endpoint: "/api/hiring-channels/referral-posting",
      body: body,
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
  ResultFuture<List<ReferralApplication>> getApplicationByReferralJobId({
    required String jobId,
  }) async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.applicationMyReferralApplications,
      queryParams: {'jobId': jobId, 'adminApprovalStatus': 'Approved'},
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;
      if (response.isNotEmpty) {
        final applicationResponse = response['data'] as List<dynamic>;
        final applications = applicationResponse
            .map(
              (application) => ReferralApplication.fromJson(
                application as Map<String, dynamic>,
              ),
            )
            .toList();

        return Right(applications);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }
    return const Right([]);
  }

  @override
  ResultFuture<List<ReferralPostModel>> getPostedJob() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.apiStudentDashboardPostedReferralJob,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;
      if (response.isNotEmpty) {
        final jobResponse = response['data'] as List<dynamic>;
        final jobs = jobResponse
            .map(
              (job) => ReferralPostModel.fromJson(job as Map<String, dynamic>),
            )
            .toList();

        return Right(jobs);
      }
    } catch (e, s) {
      log('$e\n$s');

      return Left(APIException.from(e));
    }
    return const Right([]);
  }

  @override
  ResultFuture<ReferralPostModel?> updateReferralJobStatus({
    required String applicationId,
    required String status,
  }) async {
    final request = Request(
      method: RequestMethod.patch,
      endpoint: '${Endpoints.applicationUpdateStatus}/$applicationId',
      body: {"status": status},
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;
      if (response.isNotEmpty) {
        final data = response['data'] as Map<String, dynamic>;
        final job = ReferralPostModel.fromJson(data);
        return Right(job);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }
    return const Right(null);
  }

  @override
  ResultFuture<List<Job>> getOffCampusJobs() async {
    final Request request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.referalListing,
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
  ResultFuture<void> deleteReferralJob({required String jobId}) async {
    final request = Request(
      method: RequestMethod.delete,
      endpoint: '/api/delete-job/$jobId',
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
  ResultFuture<void> toggleReferralJobStatus({required String jobId}) async {
    final request = Request(
      method: RequestMethod.patch,
      endpoint: '/company/jobmanagement/referral/$jobId',
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
