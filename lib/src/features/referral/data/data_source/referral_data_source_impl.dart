import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';
import 'package:rawrecruit/src/features/referral/data/data_source/referral_data_source.dart';

class ReferralDataSourceImpl implements ReferralDataSource {
  final NetworkService networkService = getIt<NetworkService>();

  @override
  ResultFuture<List<ReferralApplication>> getAllRequests() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.applicationAllReferrals,
      isSafeRoute: true,
    );

    try {
      final result = await networkService.request(request);
      final response = result.data as Map<String, dynamic>;
      if (response.isNotEmpty) {
        List<dynamic> data = response['data'] as List<dynamic>;
        List<ReferralApplication> requests = data
            .map(
              (request) =>
                  ReferralApplication.fromJson(request as Map<String, dynamic>),
            )
            .toList();

        return Right(requests);
      }
    } catch (e) {
      final exception = APIException.from(e);
      return Left(exception);
    }

    return Right([]);
  }
}
