import 'package:rawrecruit/src/features/dashboard/data/repository/dashboard_repository.dart';
import 'package:rawrecruit/src/features/dashboard/entities/internship_model.dart';
import 'package:rawrecruit/src/features/dashboard/entities/job_model.dart';

import '../../../../core/index.dart';

class DashboardViewModel extends ViewStateProvider {
  final _repository = getIt<DashboardRepository>();

  List<JobModel> jobs = [];
List<InternshipModel> internships = [];

  Future<Failure?> getJobs() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _repository.getOffCampusJobs();

    result.fold(
      (exception) {
        failure =
            APIFailure.fromException(exception: exception);
      },
      (data) {
        jobs = data;
      },
    );

    setViewState(ViewState.complete);
    return failure;
  }


Future<Failure?> getInternships() async {
  Failure? failure;

  setViewState(ViewState.busy);

  final result = await _repository.getInternships();

  result.fold(
    (exception) {
      failure =
          APIFailure.fromException(exception: exception);
    },
    (data) {
      internships = data;
    },
  );

  setViewState(ViewState.complete);
  return failure;
}


}
