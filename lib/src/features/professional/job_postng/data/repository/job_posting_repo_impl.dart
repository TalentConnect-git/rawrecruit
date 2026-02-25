import 'package:rawrecruit/src/features/professional/job_postng/data/data_source/job_posting_data_source.dart';
import 'package:rawrecruit/src/features/professional/job_postng/data/repository/job_posting_repo.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';

import '../../../../../core/index.dart';
import '../../presentation/entities/referral_application.dart';

class ReferralPostRepositoryImpl implements ReferralPostRepository {
  final ReferralPostDataSource _dataSource;

  ReferralPostRepositoryImpl(this._dataSource);

  @override
  ResultFuture<void> postReferralJob(ReferralPostModel model) {
    return _dataSource.postReferralJob(model);
  }

  @override
  ResultFuture<List<ReferralApplication>> getApplicationByReferralJobId({
    required String jobId,
  }) => _dataSource.getApplicationByReferralJobId(jobId: jobId);

  @override
  ResultFuture<List<ReferralPostModel>> getPostedJob() =>
      _dataSource.getPostedJob();

  @override
  ResultFuture<ReferralPostModel?> updateReferralJobStatus({
    required String applicationId,
    required String status,
  }) => _dataSource.updateReferralJobStatus(
    applicationId: applicationId,
    status: status,
  );
}
