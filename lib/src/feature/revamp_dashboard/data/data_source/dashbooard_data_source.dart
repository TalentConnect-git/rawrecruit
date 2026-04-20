import '../../../../core/index.dart';

abstract class DashboardDataSource {
  ResultFuture<List<Job>> getOffCampusJobs();

  ResultFuture<List<Job>> getInternships();
  ResultFuture<List<Job>> getReferralJobs();
  ResultFuture<Job> getReferralJobDetails(String id);
  ResultFuture<void> applyReferral(String referralId);
  ResultFuture<List<Job>> getCollegeAlumni();
  ResultFuture<List<Job>> getCompanyAlumni();
}
