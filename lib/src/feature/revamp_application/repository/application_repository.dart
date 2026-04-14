import 'package:rawrecruit/src/feature/revamp_application/entities/application_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';

import '../../../core/index.dart';

abstract class ApplicationRepository {

  ResultFuture<void> applyOffCampus({
    required String jobId,
  });

  ResultFuture<List<Job>>
      fetchAppliedJobs(); // ✅ only one method

        ResultFuture<List<ReferralApplication>> fetchReferralApplications();

}