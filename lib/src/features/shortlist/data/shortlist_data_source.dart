import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/shortlist/entities/shortlist_model.dart';

abstract class ShortlistDataSource {
  ResultFuture<void> saveOpportunity({
    required String jobId,
    required String jobType,
  });

  ResultFuture<void> removeOpportunity({
    required String jobId,
  });

  ResultFuture<List<ShortlistModel>>
      fetchSavedOpportunities({
    required String jobType,
  });
}
