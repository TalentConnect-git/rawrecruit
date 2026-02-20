import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/shortlist/entities/shortlist_model.dart';
import 'shortlist_data_source.dart';

class ShortlistDataSourceImpl implements ShortlistDataSource {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<void> saveOpportunity({
    required String jobId,
    required String jobType,
  }) async {
    final request = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.saveOpportunity,
      body: {"jobId": jobId, "jobType": jobType},
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
  ResultFuture<void> removeOpportunity({required String jobId}) async {
    final request = Request(
      method: RequestMethod.delete,
      endpoint: "${Endpoints.saveOpportunity}/$jobId",
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
  ResultFuture<List<ShortlistModel>> fetchSavedOpportunities({
    required String jobType,
  }) async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.saveOpportunity,
      queryParams: {"jobType": jobType},
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final data = result.data as List;

      final list = data.map((e) => ShortlistModel.fromJson(e)).toList();

      return Right(list);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
