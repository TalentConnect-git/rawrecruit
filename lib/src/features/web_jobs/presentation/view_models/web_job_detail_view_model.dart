import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/web_jobs/data/entities/company_job.dart';
import 'package:rawrecruit/src/features/web_jobs/data/index.dart';

class WebJobDetailViewModel extends ViewStateProvider {
  CompanyJob? _job;
  CompanyJob? get job => _job;
  set job(CompanyJob? job) {
    _job = job;
    notifyListeners();
  }

  Future<Failure?> apply(CompanyJob? job) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await getIt<WebJobRepository>().applyToJob(job: job);

    result.fold((e) => failure = APIFailure.fromException(exception: e), (r) {
      job = r;
    });

    setViewState(ViewState.complete);

    return failure;
  }
}
