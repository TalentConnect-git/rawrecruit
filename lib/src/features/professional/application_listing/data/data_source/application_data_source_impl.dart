import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/features/application/entities/application_model.dart';
import 'package:rawrecruit/src/features/professional/application_listing/data/data_source/application_data_source.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';

import '../../../../../core/index.dart';

class ReferralApplicationDataSourceImpl
    implements ReferralApplicationDataSource {

  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<List<ApplicationModel>> 
  getMyReferralApplications() async {

    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.professionalAppliedJobs,
      isSafeRoute: true,
    );

    try {

      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {

        final applicationResponse = 
            response['data'] as List<dynamic>;

        final applications = applicationResponse
    .map(
      (application) => ApplicationModel.fromJson(
        application as Map<String, dynamic>,
      ),
    )
    .toList();

        return Right(applications);
      }

    } catch (e, s) {
      log('$e\n$s');
      return Left(APIException.from(e));
    }

    return const Right([]);
  }
}