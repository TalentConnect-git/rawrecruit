import 'package:rawrecruit/src/features/professional/professional_dashbaord/data/repository/prof_dashboard_repository.dart';

import '../../../../../core/index.dart';
import '../data_source/data_source.dart';
import '../entities/professional_metrics_model.dart';
import '../entities/referral_job_model.dart';

class ProfessionalRepositoryImpl
    implements ProfessionalRepository {

  final ProfessionalDataSource _dataSource;

  ProfessionalRepositoryImpl(this._dataSource);

  @override
  ResultFuture<ProfessionalMetricsModel> getMetrics() {
    return _dataSource.getMetrics();
  }

  @override
  ResultFuture<List<ReferralJobModel>> getReferralJobs() {
    return _dataSource.getReferralJobs();
  }
  @override
ResultFuture<ReferralJobModel> getReferralJobDetails(String id) {
  return _dataSource.getReferralJobDetails(id);
}
@override
ResultFuture<void> applyReferral(String referralId) {
  return _dataSource.applyReferral(referralId);
}


}