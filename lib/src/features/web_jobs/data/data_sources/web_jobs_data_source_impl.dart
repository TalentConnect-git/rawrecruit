import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/core/index.dart';

import '../entities/web_job.dart';
import 'index.dart';

class WebJobDataSourceImpl implements WebJobDataSource {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<CompanyJobsDiscovery?> discoverJobs({
    required String companyName,
  }) async {
    final Request request = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.apiCompanyJobsDiscover,
      body: {'companyName': companyName},
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final data = CompanyJobsDiscovery.fromJson(response['data']);

        return Right(data);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }
}
