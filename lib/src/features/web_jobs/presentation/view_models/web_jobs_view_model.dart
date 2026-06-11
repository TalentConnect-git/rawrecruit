import 'package:rawrecruit/src/core/index.dart';

import '../../data/entities/web_job.dart';
import '../../data/index.dart';

class WebJobViewModel extends ViewStateProvider {
  final _repository = getIt<WebJobRepository>();

  CompanyJobsDiscovery? companyJobsDiscovery;

  Future<Failure?> discoverJobs({required String companyName}) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _repository.discoverJobs(companyName: companyName);

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (response) {
        companyJobsDiscovery = response;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }

  void clearResults() {
    companyJobsDiscovery = null;
    notifyListeners();
  }
}
