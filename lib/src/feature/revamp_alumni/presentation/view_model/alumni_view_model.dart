import 'package:flutter/material.dart';
import 'package:rawrecruit/src/core/index.dart';

import '../../../revamp_dashboard/data/repository/dashboard_repository.dart';

class AlumniViewModel extends ChangeNotifier {
  final _repo = getIt<DashboardRepository>();

  List<Job> _all = [];
  List<Job> filtered = [];
Map<String, List<Job>> groupedAlumni = {};
  bool isLoading = false;

  /// 🔥 SEARCH
 Future<void> fetchAlumni() async {
  isLoading = true;
  notifyListeners();

  final result = await _repo.getAlumni();

  result.fold(
    (_) {},
    (data) {
      _all = data;
      filtered = data;

      /// 🔥 GROUP BY USER ID
      groupedAlumni = {};

      for (var job in data) {
        final id = job.candidatePosted?.id ?? "unknown";

        if (!groupedAlumni.containsKey(id)) {
          groupedAlumni[id] = [];
        }

        groupedAlumni[id]!.add(job);
      }
    },
  );

  isLoading = false;
  notifyListeners();
}


void search(String query) {
  if (query.isEmpty) {
    filtered = _all;
  } else {
    filtered = _all.where((job) {
      final name =
          job.candidatePosted?.name?.toLowerCase() ?? '';
      return name.contains(query.toLowerCase());
    }).toList();
  }

  /// 🔥 regroup filtered list
  groupedAlumni = {};

  for (var job in filtered) {
    final id = job.candidatePosted?.id ?? "unknown";

    if (!groupedAlumni.containsKey(id)) {
      groupedAlumni[id] = [];
    }

    groupedAlumni[id]!.add(job);
  }

  notifyListeners();
}
}