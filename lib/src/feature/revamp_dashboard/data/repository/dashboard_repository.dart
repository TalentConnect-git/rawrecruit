
import 'package:rawrecruit/src/feature/revamp_dashboard/data/data_source/dashbooard_data_source.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/data/repository/dashboard_repository.dart';

import '../../../../core/index.dart';

abstract class DashboardRepository {
  ResultFuture<List<Job>> getOffCampusJobs();

  ResultFuture<List<Job>> getInternships();

  ResultFuture<List<Job>> getReferralJobs();
  ResultFuture<Job> getReferralJobDetails(String id);
  ResultFuture<void> applyReferral(String referralId);
}
