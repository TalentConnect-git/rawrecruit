import '../../../../core/index.dart';
import '../../../revamp_alumni/data/company_alumni_response.dart';

abstract class DashboardRepository {
  ResultFuture<List<Job>> getOffCampusJobs();

  ResultFuture<List<Job>> getInternships();

  ResultFuture<List<Job>> getReferralJobs();
  ResultFuture<Job> getReferralJobDetails(String id);
  ResultFuture<void> applyReferral(String referralId);
  ResultFuture<List<User>> getCollegeAlumni();
  ResultFuture<CompanyAlumniResponse> getCompanyAlumni();
}
