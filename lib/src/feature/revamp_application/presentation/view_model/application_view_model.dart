import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/entities/application_model.dart';
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
}) async {
Either<APIException, void> result;
  if (jobType == "Referral") {
    result = await _repository.applyReferral(jobId);
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

  /// 🔹 FETCH APPLIED LIST
 Future<void> fetchApplications() async {
  print("running fetch applications");
 setViewState(ViewState.busy);
  notifyListeners();

  final result = await _repository.fetchAppliedJobs();

  result.fold(
    (failure) {
    setViewState(ViewState.idle);
    },
 (jobs) {
  appliedApplications = jobs;

  print("🔥 JOBS LENGTH: ${jobs.length}");

  setViewState(ViewState.idle);
},
  );

  notifyListeners();
}


  /// ✅ NEW FUNCTION
  Future<void> fetchReferralRequests() async {
    setViewState(ViewState.busy);
    notifyListeners();

    final result = await _repository.fetchReferralApplications();

    result.fold(
      (failure) => setViewState(ViewState.idle),
      (data) {
        referralApplications = data;
        setViewState(ViewState.idle);
      },
    );

    notifyListeners();
  }
}
