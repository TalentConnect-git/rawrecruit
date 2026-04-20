import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/referral/data/data_source/referral_data_source.dart';
import 'package:rawrecruit/src/features/referral/data/repository/referral_repository.dart';

import '../../../professional/job_postng/presentation/entities/referral_application.dart';

class ReferralRepositoryImpl implements ReferralRepository {
  ReferralRepositoryImpl({required ReferralDataSource dataSource})
    : _referralDataSource = dataSource;

  final ReferralDataSource _referralDataSource;

  @override
  ResultFuture<List<ReferralApplication>> getAllRequests() =>
      _referralDataSource.getAllRequests();
}
