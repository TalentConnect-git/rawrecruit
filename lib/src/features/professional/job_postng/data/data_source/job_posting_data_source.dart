import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';

import '../../../../../core/index.dart';
import '../../presentation/entities/referral_application.dart';

abstract class ReferralPostDataSource {
  ResultFuture<void> postReferralJob(ReferralPostModel model);

  ResultFuture<List<ReferralPostModel>> getPostedJob();

  ResultFuture<List<ReferralApplication>> getApplicationByReferralJobId({
    required String jobId,
  });

  ResultFuture<ReferralPostModel?> updateReferralJobStatus({
    required String applicationId,
    required String status,
  });
   ResultFuture<List<Job>> getOffCampusJobs();
ResultFuture<void> deleteReferralJob({
  required String jobId,
});
}
