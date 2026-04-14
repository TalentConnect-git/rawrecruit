import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/entities/application_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';
abstract class ApplicationDataSource {

  ResultFuture<void> applyOffCampus({
    required String jobId,
  });

  ResultFuture<List<Job>>
      fetchAppliedJobs();
    ResultFuture<List<Job>> fetchReferralAppliedJobs();
  ResultFuture<List<Job>> fetchInternshipAppliedJobs();
ResultFuture<void> applyReferral(String referralId);
ResultFuture<void> applyInternship(String jobId);
        ResultFuture<List<ReferralApplication>> fetchReferralApplications();
ResultFuture<List<ReferralApplication>> fetchReferredByMe();

}