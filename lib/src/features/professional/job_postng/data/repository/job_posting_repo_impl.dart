

import 'package:rawrecruit/src/features/professional/job_postng/data/data_source/job_posting_data_source.dart';
import 'package:rawrecruit/src/features/professional/job_postng/data/repository/job_posting_repo.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';

import '../../../../../core/index.dart';

class ReferralPostRepositoryImpl
    implements ReferralPostRepository {

  final ReferralPostDataSource _dataSource;

  ReferralPostRepositoryImpl(
    this._dataSource,
  );

  @override
  ResultFuture<void> postReferralJob(
      ReferralPostModel model) {
    return _dataSource.postReferralJob(model);
  }
}