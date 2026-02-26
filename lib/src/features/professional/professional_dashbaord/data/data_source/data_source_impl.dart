import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/core/index.dart';

import '../entities/professional_metrics_model.dart';
import '../entities/referral_job_model.dart';
import 'data_source.dart';

class ProfessionalDataSourceImpl
    implements ProfessionalDataSource {

  final NetworkService _networkService =
      NetworkService();

  @override
  ResultFuture<ProfessionalMetricsModel> getMetrics() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.metrics,
      isSafeRoute: true,
    );

    try {
      final result =
          await _networkService.request(request);

      final data = result.data["data"];

      return Right(
        ProfessionalMetricsModel.fromJson(data),
      );
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<ReferralJobModel>> getReferralJobs() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint:
Endpoints.referalListing,
      isSafeRoute: true,
    );

    try {
      final result =
          await _networkService.request(request);

      final list =
          (result.data["data"] as List)
              .map((e) =>
                  ReferralJobModel.fromJson(e))
              .toList();

      return Right(list);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
ResultFuture<ReferralJobModel> getReferralJobDetails(String id) async {

  final request = Request(
    method: RequestMethod.get,
    endpoint: "/jobs/jobDetails/referral/$id",
    isSafeRoute: true,
  );

  try {
    final result =
        await _networkService.request(request);

    final data =
        (result.data as List).first;

    return Right(
      ReferralJobModel.fromJson(data),
    );
  } catch (e) {
    return Left(APIException.from(e));
  }
}
@override
ResultFuture<void> applyReferral(String referralId) async {

  final request = Request(
    method: RequestMethod.post,
    endpoint: "/application/candidate/referral",
    body: {
      "referralId": referralId,
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
}