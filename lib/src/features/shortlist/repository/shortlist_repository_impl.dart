import 'package:rawrecruit/src/features/shortlist/data/shortlist_data_source.dart';

import '../../../core/index.dart';
import '../entities/shortlist_model.dart';
import 'shortlist_repository.dart';

class ShortlistRepositoryImpl
    implements ShortlistRepository {

  final ShortlistDataSource _dataSource;

  ShortlistRepositoryImpl(
      {required ShortlistDataSource dataSource})
      : _dataSource = dataSource;

  @override
  ResultFuture<void> saveOpportunity({
    required String jobId,
    required String jobType,
  }) =>
      _dataSource.saveOpportunity(
        jobId: jobId,
        jobType: jobType,
      );

  @override
  ResultFuture<void> removeOpportunity({
    required String jobId,
  }) =>
      _dataSource.removeOpportunity(
        jobId: jobId,
      );

  @override
  ResultFuture<List<ShortlistModel>>
      fetchSavedOpportunities({
    required String jobType,
  }) =>
      _dataSource.fetchSavedOpportunities(
        jobType: jobType,
      );
}
