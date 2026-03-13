import 'package:get_it/get_it.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/application/entities/application_model.dart';
import 'package:rawrecruit/src/features/application/repository/application_repository.dart';

enum ApplicationTab { offCampus, internship }

class ApplicationViewModel extends ViewStateProvider {
  final _repository = GetIt.instance<ApplicationRepository>();

  /// 🔹 Full list (for Applications screen)
  List<ApplicationModel> appliedApplications = [];

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
    setViewState(ViewState.busy);

    final result = await _repository.fetchAppliedJobs();

    result.fold((failure) {}, (data) {
      appliedApplications = data;

      appliedJobIds.clear();

      for (final item in data) {
        if (item.jobDetails?.id != null) {
          appliedJobIds.add(item.jobDetails!.id!);
        }
      }
    });

    setViewState(ViewState.complete);
    notifyListeners();
  }
}
