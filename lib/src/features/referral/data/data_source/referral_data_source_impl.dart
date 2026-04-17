import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/referral/data/data_source/referral_data_source.dart';
import 'package:rawrecruit/src/features/referral/data/entities/incoming_request.dart';

class ReferralDataSourceImpl implements ReferralDataSource {
  final NetworkService networkService = NetworkService();

  @override
  ResultFuture<List<IncomingRequest>> getAllRequests() async {
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
        List<IncomingRequest> requests = data
            .map(
              (request) =>
                  IncomingRequest.fromJson(request as Map<String, dynamic>),
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
