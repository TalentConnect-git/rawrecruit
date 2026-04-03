import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/entities/application_model.dart';

import 'application_data_source.dart';

class ApplicationDataSourceImpl implements ApplicationDataSource {
  final NetworkService _networkService = NetworkService();

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

  @override
  ResultFuture<List<ApplicationModel>> fetchAppliedJobs() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.applicationStatus,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final body = result.data as Map<String, dynamic>;

      // 🔥 CORRECT EXTRACTION
      final List<dynamic> data = body['data'];

      final list = data.map((e) => ApplicationModel.fromJson(e)).toList();

      return Right(list);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
