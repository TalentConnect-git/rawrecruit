import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/referral/data/repository/referral_repository.dart';

import '../../../professional/job_postng/presentation/entities/referral_application.dart';

class ReferralHomeViewModel extends ViewStateProvider {
  final ReferralRepository _referralRepository = getIt<ReferralRepository>();

  List<ReferralApplication> _referralApplications = [];
  List<ReferralApplication> get referralApplications => _referralApplications;

  Future<Failure?> getRequests() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _referralRepository.getAllRequests();

    result.fold(
      (e) {
        failure = APIFailure.fromException(exception: e);
      },
      (r) {
        _referralApplications = r;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
}
