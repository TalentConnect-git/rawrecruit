import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/referral/data/data_source/referral_data_source.dart';
import 'package:rawrecruit/src/features/referral/data/entities/incoming_request.dart';
import 'package:rawrecruit/src/features/referral/data/repository/referral_repository.dart';

class ReferralRepositoryImpl implements ReferralRepository {
  ReferralRepositoryImpl({required ReferralDataSource dataSource})
    : _referralDataSource = dataSource;

  final ReferralDataSource _referralDataSource;

  @override
  ResultFuture<List<IncomingRequest>> getAllRequests() =>
      _referralDataSource.getAllRequests();
}
