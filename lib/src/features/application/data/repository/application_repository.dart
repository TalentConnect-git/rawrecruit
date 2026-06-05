import 'package:rawrecruit/src/features/application/index.dart'
    show ApplicationModel;
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';

import '../../../../core/index.dart';

abstract class ApplicationRepository {
  ResultFuture<void> applyOffCampus({required String jobId});

  ResultFuture<List<ApplicationModel>> fetchAppliedJobs(); // ✅ only one method
  ResultFuture<void> applyReferral(
    String referralId,
    int? matchScore,
    String companyName,
  );
  ResultFuture<void> applyInternship(String jobId);
  ResultFuture<List<ReferralApplication>> fetchReferralApplications();
  ResultFuture<List<ReferralApplication>> fetchReferredByMe();
  ResultFuture<List<ApplicationModel>> fetchReferralAppliedJobs();
  ResultFuture<List<ApplicationModel>> fetchInternshipAppliedJobs();
  ResultFuture<void> updateReferralStatus({
    required String applicationId,
    required String status,
    required String jobRole,
  });

  ResultFuture<ApplicationModel?> getApplicationById({
    required String applicationId,
  });
}
