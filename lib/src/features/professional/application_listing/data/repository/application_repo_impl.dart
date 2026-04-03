import 'package:rawrecruit/src/feature/revamp_application/entities/application_model.dart';
import 'package:rawrecruit/src/features/professional/application_listing/data/data_source/application_data_source.dart';
import 'package:rawrecruit/src/features/professional/application_listing/data/repository/application_repo.dart';

import '../../../../../core/index.dart';

class ReferralApplicationRepositoryImpl
    implements ReferralApplicationRepository {

  final ReferralApplicationDataSource _dataSource;

  ReferralApplicationRepositoryImpl(this._dataSource);

ResultFuture<List<ApplicationModel>> getMyReferralApplications() {
  return _dataSource.getMyReferralApplications();
}
}