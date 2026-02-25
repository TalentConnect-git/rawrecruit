import 'dart:developer';

import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/data/repository/job_posting_repo.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';

class PostedJobViewModel extends ViewStateProvider {
  final _referralPostRepository = getIt<ReferralPostRepository>();

  List<ReferralPostModel> _jobs = [];
  List<ReferralPostModel> get jobs => _jobs;
  set jobs(List<ReferralPostModel> jobs) {
    _jobs = jobs;
    notifyListeners();
  }

  Future<Failure?> getPostedJobs() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _referralPostRepository.getPostedJob();

    result.fold(
      (e) {
        failure = APIFailure.fromException(exception: e);
      },
      (r) {
        jobs = r;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
}
