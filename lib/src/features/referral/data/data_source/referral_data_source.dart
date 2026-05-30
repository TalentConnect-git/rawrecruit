import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';

abstract class ReferralDataSource {
  ResultFuture<List<ReferralApplication>> getAllRequests();
}
