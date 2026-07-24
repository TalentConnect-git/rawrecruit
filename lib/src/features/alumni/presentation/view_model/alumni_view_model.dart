import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/core/models/experience.dart';
import 'package:rawrecruit/src/features/dashboard/data/repository/dashboard_repository.dart';

class AlumniViewModel extends ChangeNotifier {
  final _repo = getIt<DashboardRepository>();

  bool isLoading = false;

  /// SOURCE DATA
  final List<User> _collegeSource = [];
  final List<User> _hiringSource = [];
  final List<User> _companySource = [];

  /// FILTERED DATA
  List<User> filtered = [];

  /// UI MAPS (UNCHANGED)
  Map<String, List<Job>> hiringAlumni = {};
  Map<String, List<Job>> collegeAlumni = {};
  Map<String, List<Job>> companyAlumni = {};

  List<List<Job>> jobs(AlumniType type) {
    switch (type) {
      case AlumniType.hiring:
        return hiringAlumni.values.toList();

      case AlumniType.college:
        return collegeAlumni.values.toList();

      case AlumniType.company:
        return companyAlumni.values.toList();
    }
  }

  // =========================================================
  // HELPERS
  // =========================================================

  Map<String, List<Job>> _groupUsers(List<User> users) {
    final Map<String, List<Job>> grouped = {};

    for (final user in users) {
      final id = user.id ?? "unknown";

      grouped.putIfAbsent(id, () => []);

      grouped[id]!.add(Job(candidatePosted: user));
    }
    log("GROUP USERS COUNT => ${users.length}");

    for (final user in users) {
      log("USER ID => ${user.id}");
      log("USER NAME => ${user.name}");
    }
    return grouped;
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // =========================================================
  // COLLEGE ALUMNI
  // =========================================================

  Future<void> fetchCollegeAlumni() async {
    _setLoading(true);

    final result = await _repo.getCollegeAlumni();

    result.fold(
      (failure) {
        log("College alumni error: $failure");
      },
      (data) {
        _collegeSource
          ..clear()
          ..addAll(data);

        filtered = List.from(_collegeSource);

        collegeAlumni = _groupUsers(filtered);
        log("COLLEGE SOURCE => ${_collegeSource.length}");
        log("FILTERED => ${filtered.length}");
        log("GROUPED => ${collegeAlumni.length}");
      },
    );

    _setLoading(false);
  }

  // =========================================================
  // HIRING ALUMNI
  // =========================================================

  Future<void> fetchHiringAlumni() async {
    _setLoading(true);

    final result = await _repo.getHiringAlumni(onlyPostedJob: true);

    result.fold(
      (failure) {
        log("Hiring alumni error: $failure");
      },
      (data) {
        log('Hiring Alumni: ${data.toString()}');

        _hiringSource
          ..clear()
          ..addAll(data);

        filtered = List.from(_hiringSource);

        hiringAlumni = _groupUsers(filtered);
      },
    );

    _setLoading(false);
  }

  // =========================================================
  // COMPANY ALUMNI
  // =========================================================
  Future<void> fetchCompanyAlumni() async {
    _setLoading(true);

    final result = await _repo.getCompanyAlumni();

    result.fold(
      (failure) {
        log("Company alumni error: $failure");
      },
      (res) {
        final allCompanies = res.alumni ?? {};

        log("API Companies => ${allCompanies.keys.toList()}");

        // Get all alumni from all companies
        final companyAlumniList = allCompanies.values.expand((e) => e).toList();

        log("Company Alumni Count => ${companyAlumniList.length}");

        _companySource
          ..clear()
          ..addAll(companyAlumniList);

        filtered = List.from(_companySource);

        companyAlumni = _groupUsers(filtered);

        log("Final Company Alumni Groups => ${companyAlumni.length}");

        notifyListeners();
      },
    );

    _setLoading(false);
  }
  // =========================================================
  // SEARCH
  // =========================================================

  void search(String query, AlumniType type) {
    final source = switch (type) {
      AlumniType.college => _collegeSource,
      AlumniType.hiring => _hiringSource,
      AlumniType.company => _companySource,
    };

    if (query.trim().isEmpty) {
      filtered = List.from(source);
    } else {
      final q = query.toLowerCase().trim();

      filtered = source.where((user) {
        final name = user.name?.toLowerCase() ?? '';
        final company = user.currentCompany?.toLowerCase() ?? '';
        final skills = user.skills?.join(' ').toLowerCase() ?? '';

        return name.contains(q) || company.contains(q) || skills.contains(q);
      }).toList();
    }

    final grouped = _groupUsers(filtered);

    switch (type) {
      case AlumniType.college:
        collegeAlumni = grouped;
        break;

      case AlumniType.hiring:
        hiringAlumni = grouped;
        break;

      case AlumniType.company:
        companyAlumni = grouped;
        break;
    }

    notifyListeners();
  }
}
