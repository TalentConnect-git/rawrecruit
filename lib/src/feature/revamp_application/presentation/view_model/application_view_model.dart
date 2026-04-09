import 'package:get_it/get_it.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/entities/application_model.dart';
import 'package:rawrecruit/src/feature/revamp_application/repository/application_repository.dart';

enum ApplicationTab { offCampus, internship }

class ApplicationViewModel extends ViewStateProvider {
  final _repository = GetIt.instance<ApplicationRepository>();

  /// 🔹 Full list (for Applications screen)
  List<Job> appliedApplications = [];

  /// 🔹 Only IDs (for dashboard Apply button state)
  final Set<String> appliedJobIds = {};

  bool isApplied(String jobId) => appliedJobIds.contains(jobId);

  /// 🔹 APPLY
  Future<void> apply(String jobId) async {
    final result = await _repository.applyOffCampus(jobId: jobId);

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
}
