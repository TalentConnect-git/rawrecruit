import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/repository/application_repository.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';

enum ApplicationTab { offCampus, internship }

class ApplicationViewModel extends ViewStateProvider {
  final _repository = GetIt.instance<ApplicationRepository>();
  List<ReferralApplication> referralApplications = [];
  List<ReferralApplication> referredByMe = [];

  /// 🔹 Full list (for Applications screen)
  List<Job> appliedApplications = [];

  /// 🔹 Only IDs (for dashboard Apply button state)
  final Set<String> appliedJobIds = {};

  bool isApplied(String jobId) => appliedJobIds.contains(jobId);

  Future<void> fetchReferredByMe() async {
    setViewState(ViewState.busy);
    notifyListeners();

    final result = await _repository.fetchReferredByMe();

    result.fold(
      (failure) {
        setViewState(ViewState.idle);
      },
      (data) {
        referredByMe = data;
        setViewState(ViewState.idle);
      },
    );

    notifyListeners();
  }

  Future<void> apply({
    required String jobId,
    required String jobType,
    int? matchScore,
  }) async {
    Either<APIException, void> result;
    if (jobType == "Referral") {
      result = await _repository.applyReferral(jobId, matchScore);
    } else if (jobType == "Internship") {
      result = await _repository.applyInternship(jobId);
    } else {
      result = await _repository.applyOffCampus(jobId: jobId);
    }

    result.fold((failure) {}, (_) {
      appliedJobIds.add(jobId);
    });

    notifyListeners();
  }

  Future<void> updateReferralStatus({
    required BuildContext context,
    required String applicationId,
    required String status,
    required String jobRole,
  }) async {
    final result = await _repository.updateReferralStatus(
      applicationId: applicationId,
      status: status,
      jobRole: jobRole,
    );

    result.fold(
      (failure) {
        Toasts.showErrorToast(context, message: failure.message);
      },
      (_) async {
        Toasts.showSuccessToast(
          context,
          message: "Status updated successfully",
        );

        await fetchReferredByMe();
      },
    );
  }

  /// 🔹 FETCH APPLIED LIST
  Future<void> fetchApplications() async {
    setViewState(ViewState.busy);
    notifyListeners();

    final offCampus = await _repository.fetchAppliedJobs();
    final referral = await _repository.fetchReferralAppliedJobs();
    final internship = await _repository.fetchInternshipAppliedJobs();

    List<Job> all = [];

    offCampus.fold((_) {}, (data) => all.addAll(data));
    referral.fold((_) {}, (data) => all.addAll(data));
    internship.fold((_) {}, (data) => all.addAll(data));

    appliedApplications = all;

    appliedJobIds.clear();
    for (final job in all) {
      if (job.id != null) {
        appliedJobIds.add(job.id!);
      }
    }

    setViewState(ViewState.complete);
    notifyListeners();
  }

  /// ✅ NEW FUNCTION
  Future<void> fetchReferralRequests() async {
    setViewState(ViewState.busy);
    notifyListeners();

    final result = await _repository.fetchReferralApplications();

    result.fold((failure) => setViewState(ViewState.idle), (data) {
      referralApplications = data;
      setViewState(ViewState.idle);
    });

    notifyListeners();
  }
}
