import 'package:rawrecruit/src/feature/revamp_dashboard/data/data_source/dashbooard_data_source.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/data/repository/dashboard_repository.dart';

import '../../../../core/index.dart';
import '../../../revamp_alumni/data/company_alumni_response.dart';

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
  ResultFuture<List<User>> getCollegeAlumni() => _dataSource.getCollegeAlumni();

  @override
  ResultFuture<CompanyAlumniResponse> getCompanyAlumni() =>
      _dataSource.getCompanyAlumni();

  @override
  ResultFuture<List<User>> getAlumniByCompany({
    required String companyName,
    required String userId,
  }) =>
      _dataSource.getAlumniByCompany(companyName: companyName, userId: userId);

  @override
  ResultFuture<List<User>> getHiringAlumni({required bool onlyPostedJob}) =>
      _dataSource.getHiringAlumni(onlyPostedJob: onlyPostedJob);
}
