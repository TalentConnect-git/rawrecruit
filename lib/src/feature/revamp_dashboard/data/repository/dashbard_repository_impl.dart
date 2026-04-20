import 'package:rawrecruit/src/feature/revamp_dashboard/data/data_source/dashbooard_data_source.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/data/repository/dashboard_repository.dart';

import '../../../../core/index.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl({required DashboardDataSource dataSource})
    : _dataSource = dataSource;

  final DashboardDataSource _dataSource;

  @override
  ResultFuture<List<Job>> getOffCampusJobs() => _dataSource.getOffCampusJobs();

  @override
  ResultFuture<List<Job>> getInternships() => _dataSource.getInternships();

  @override
  ResultFuture<List<Job>> getReferralJobs() {
    return _dataSource.getReferralJobs();
  }

  @override
  ResultFuture<Job> getReferralJobDetails(String id) {
    return _dataSource.getReferralJobDetails(id);
  }

  @override
  ResultFuture<void> applyReferral(String referralId) {
    return _dataSource.applyReferral(referralId);
  }

  @override
  ResultFuture<List<Job>> getCollegeAlumni() => _dataSource.getCollegeAlumni();

  @override
  ResultFuture<List<Job>> getCompanyAlumni() => _dataSource.getCompanyAlumni();
}
