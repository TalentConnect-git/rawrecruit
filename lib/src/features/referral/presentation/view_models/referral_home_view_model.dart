import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/referral/data/repository/referral_repository.dart';

import '../../data/entities/incoming_request.dart';

class ReferralHomeViewModel extends ViewStateProvider {
  final ReferralRepository _referralRepository = getIt<ReferralRepository>();

  List<IncomingRequest> _incomingRequests = [];
  List<IncomingRequest> get incomingRequests => _incomingRequests;

  Future<Failure?> getRequests() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _referralRepository.getAllRequests();

    result.fold(
      (e) {
        failure = APIFailure.fromException(exception: e);
      },
      (r) {
        _incomingRequests = r;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
}
