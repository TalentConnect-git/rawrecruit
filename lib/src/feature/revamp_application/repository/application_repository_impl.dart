import 'package:rawrecruit/src/feature/revamp_application/data/application_data_source.dart';
import 'package:rawrecruit/src/feature/revamp_application/repository/application_repository.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';

import '../../../core/index.dart';

class ApplicationRepositoryImpl implements ApplicationRepository {
  final ApplicationDataSource _dataSource;

  ApplicationRepositoryImpl(this._dataSource);

  @override
  ResultFuture<void> applyOffCampus({required String jobId}) {
    return _dataSource.applyOffCampus(jobId: jobId);
  }

  @override
  ResultFuture<void> applyReferral(String referralId, int? matchScore) {
    return _dataSource.applyReferral(referralId, matchScore);
  }

  @override
  ResultFuture<void> applyInternship(String jobId) {
    return _dataSource.applyInternship(jobId);
  }

  @override
  ResultFuture<List<Job>> fetchAppliedJobs() {
    return _dataSource.fetchAppliedJobs();
  }

  @override
  ResultFuture<List<ReferralApplication>> fetchReferredByMe() {
    return _dataSource.fetchReferredByMe();
  }

  @override
  ResultFuture<List<ReferralApplication>> fetchReferralApplications() {
    return _dataSource.fetchReferralApplications();
  }

  @override
  ResultFuture<List<Job>> fetchReferralAppliedJobs() {
    return _dataSource.fetchReferralAppliedJobs();
  }

  @override
  ResultFuture<List<Job>> fetchInternshipAppliedJobs() {
    return _dataSource.fetchInternshipAppliedJobs();
  }

  @override
  ResultFuture<void> updateReferralStatus({
    required String applicationId,
    required String status,
    required String jobRole,
  }) {
    return _dataSource.updateReferralStatus(
      applicationId: applicationId,
      status: status,
      jobRole: jobRole,
    );
  }
}
