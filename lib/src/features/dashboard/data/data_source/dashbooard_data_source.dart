import 'package:rawrecruit/src/features/alumni/index.dart'
    show CompanyAlumniResponse;

import '../../../../core/index.dart';

abstract class DashboardDataSource {
  ResultFuture<List<Job>> getOffCampusJobs();

  ResultFuture<List<Job>> getInternships();
  ResultFuture<List<Job>> getReferralJobs();
  ResultFuture<Job> getReferralJobDetails(String id);
  ResultFuture<void> applyReferral(String referralId);

  ResultFuture<List<User>> getCollegeAlumni();
  ResultFuture<CompanyAlumniResponse> getCompanyAlumni();
  ResultFuture<List<User>> getHiringAlumni({required bool onlyPostedJob});
  ResultFuture<List<User>> getAlumniByCompany({
    required String companyName,
    required String userId,
  });

  ResultFuture<User?> getUserById({required String userId});

  ResultFuture<User?> getMessageDetailById({required String userId});
}
