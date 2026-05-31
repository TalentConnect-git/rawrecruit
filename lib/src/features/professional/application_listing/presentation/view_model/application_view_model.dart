import 'package:get_it/get_it.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/application/index.dart'
    show ApplicationModel;
import 'package:rawrecruit/src/features/professional/application_listing/data/repository/application_repo.dart';

class ReferralApplicationsViewModel extends ViewStateProvider {
  final _repository = GetIt.instance<ReferralApplicationRepository>();

  List<ApplicationModel> applications = [];

  Future<void> fetchReferralApplications() async {
    setViewState(ViewState.busy);

    final result = await _repository.getMyReferralApplications();

    result.fold((failure) {}, (data) => applications = data);

    setViewState(ViewState.complete);
    notifyListeners();
  }
}
