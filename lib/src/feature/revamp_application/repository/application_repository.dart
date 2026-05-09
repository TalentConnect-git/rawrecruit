import 'package:rawrecruit/src/feature/revamp_application/entities/application_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';

import '../../../core/index.dart';

abstract class ApplicationRepository {

  ResultFuture<void> applyOffCampus({
    required String jobId,
  });

  ResultFuture<List<Job>>
      fetchAppliedJobs(); // ✅ only one method
ResultFuture<void> applyReferral(String referralId);
ResultFuture<void> applyInternship(String jobId);
        ResultFuture<List<ReferralApplication>> fetchReferralApplications();
        ResultFuture<List<ReferralApplication>> fetchReferredByMe();
         ResultFuture<List<Job>> fetchReferralAppliedJobs();
  ResultFuture<List<Job>> fetchInternshipAppliedJobs();
ResultFuture<void> updateReferralStatus({
  required String applicationId,
  required String status,
  required String jobRole,
});
}