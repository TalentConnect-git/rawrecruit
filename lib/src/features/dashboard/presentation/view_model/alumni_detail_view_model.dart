import 'dart:developer';

import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/dashboard/index.dart';

class AlumniDetailViewModel extends ViewStateProvider {
  User? _alumni;
  User? get alumni => _alumni;
  set alumni(User? value) {
    _alumni = value;
    notifyListeners();
  }

  Future<Failure?> getAlumniByid(String id) async {
    setViewState(ViewState.busy);

    Failure? failure;

    final result = await getIt<DashboardRepository>().getUserById(userId: id);
    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (res) {
        alumni = res;

        log('Alumni ${res?.toJson()}');
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
}
