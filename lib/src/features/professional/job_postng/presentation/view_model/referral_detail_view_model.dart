import 'package:rawrecruit/src/core/index.dart';

import '../../../../application/data/index.dart';

class ReferralDetailViewModel extends ViewStateProvider {
  ApplicationModel? _application;
  ApplicationModel? get application => _application;
  set application(ApplicationModel? value) {
    _application = value;
    notifyListeners();
  }

  Future<Failure?> getApplicationDetail(String applicationId) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await getIt<ApplicationRepository>().getApplicationById(
      applicationId: applicationId,
    );

    result.fold((e) => failure = APIFailure.fromException(exception: e), (r) {
      application = r;
    });

    setViewState(ViewState.complete);

    return failure;
  }
}
