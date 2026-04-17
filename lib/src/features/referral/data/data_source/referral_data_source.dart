import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/referral/data/entities/incoming_request.dart';

abstract class ReferralDataSource {
  ResultFuture<List<IncomingRequest>> getAllRequests();
}
