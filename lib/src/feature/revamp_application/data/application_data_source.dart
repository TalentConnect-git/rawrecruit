import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';

abstract class ApplicationDataSource {
  ResultFuture<void> applyOffCampus({required String jobId});

  ResultFuture<List<Job>> fetchAppliedJobs();
  ResultFuture<List<Job>> fetchReferralAppliedJobs();
  ResultFuture<List<Job>> fetchInternshipAppliedJobs();
  ResultFuture<void> applyReferral(
    String referralId,
    int? matchScore,
    String companyName,
  );
  ResultFuture<void> applyInternship(String jobId);
  ResultFuture<List<ReferralApplication>> fetchReferralApplications();
  ResultFuture<List<ReferralApplication>> fetchReferredByMe();
  ResultFuture<void> updateReferralStatus({
    required String applicationId,
    required String status,
    required String jobRole,
  });
}
