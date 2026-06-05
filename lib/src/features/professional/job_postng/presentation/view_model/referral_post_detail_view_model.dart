import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/data/entities/referral_job_model.dart';

import '../../../professional_dashbaord/data/repository/prof_dashboard_repository.dart';

class ReferralPostDetailViewModel extends ViewStateProvider {
  ReferralJobModel? _job;
  ReferralJobModel? get job => _job;
  set job(ReferralJobModel? value) {
    _job = value;
    notifyListeners();
  }

  Future<Failure?> getReferralPostById(String id) async {
    Failure? failure;
    setViewState(ViewState.busy);

    final result = await getIt<ProfessionalRepository>().getReferralJobDetails(
      id,
    );

    result.fold(
      (e) {
        failure = APIFailure.fromException(exception: e);
      },
      (data) async {
        job = data;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
}
