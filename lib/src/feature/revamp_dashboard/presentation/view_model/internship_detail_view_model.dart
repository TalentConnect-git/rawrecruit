import 'dart:developer';

import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/data/repository/dashboard_repository.dart';

class InternshipDetailViewModel extends ViewStateProvider {
  final List<User> _companySource = [];
  Map<String, List<Job>> companyAlumni = {};

  bool _isFetchingAlumni = false;
  bool get isFetchingAlumni => _isFetchingAlumni;
  set isFetchingAlumni(bool value) {
    _isFetchingAlumni = value;
    notifyListeners();
  }

  Future<void> fetchCompanyAlumni({
    required String companyName,
    required String userId,
  }) async {
    isFetchingAlumni = true;

    final result = await getIt<DashboardRepository>().getAlumniByCompany(
      companyName: companyName,
      userId: userId,
    );

    result.fold(
      (failure) {
        log("Company alumni error: $failure");
      },
      (res) {
        _companySource
          ..clear()
          ..addAll(res);

        for (final user in _companySource) {
          final id = user.id ?? "unknown";

          companyAlumni.putIfAbsent(id, () => []);

          companyAlumni[id]!.add(Job(candidatePosted: user));
        }
      },
    );

    isFetchingAlumni = false;
  }
}
