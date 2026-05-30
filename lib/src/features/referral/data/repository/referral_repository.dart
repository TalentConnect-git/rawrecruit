import 'package:rawrecruit/src/core/index.dart';

import '../../../professional/job_postng/presentation/entities/referral_application.dart';

abstract class ReferralRepository {
  ResultFuture<List<ReferralApplication>> getAllRequests();
}
