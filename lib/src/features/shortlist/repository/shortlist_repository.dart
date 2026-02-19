import 'package:rawrecruit/src/core/index.dart';
import '../entities/shortlist_model.dart';

abstract class ShortlistRepository {

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
