import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';

import '../../../../../core/index.dart';

abstract class ReferralPostDataSource {
  ResultFuture<void> postReferralJob(
    ReferralPostModel model,
  );
}