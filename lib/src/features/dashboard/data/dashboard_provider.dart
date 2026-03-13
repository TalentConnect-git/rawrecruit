import 'package:flutter/material.dart';
import 'package:rawrecruit/src/features/dashboard/entities/job_model.dart';

import '../entities/internship_model.dart';

enum DashboardTab { internships, jobs, referral }

enum SortOption {
  newestFirst,
  oldestFirst,
  companyNameAZ,
  highestStipend,
  nearestDeadline,
}

class DashboardProvider extends ChangeNotifier {
  /// 🔹 Selected Tab
  DashboardTab _selectedTab = DashboardTab.internships;

  DashboardTab get selectedTab => _selectedTab;

  SortOption _sortOption = SortOption.newestFirst;
  SortOption get sortOption => _sortOption;

  void changeSort(SortOption option) {
    _sortOption = option;
    notifyListeners();
  }

  /// Filters
  String? selectedWorkMode;
  String? selectedLocation;
  String? selectedEmploymentType;
  String? selectedDegree;
  String? selectedCourse;
  String? selectedDuration;
  bool paidOnly = false;

  void clearFilters() {
    selectedWorkMode = null;
    selectedLocation = null;
    selectedEmploymentType = null;
    selectedDegree = null;
    selectedCourse = null;
    selectedDuration = null;
    paidOnly = false;
    notifyListeners();
  }

  void changeTab(DashboardTab tab) {
    if (_selectedTab == tab) return;
    _selectedTab = tab;
    notifyListeners();
  }

  /// 🔹 Shortlisted Jobs
  final Set<String> _shortlistedJobs = {};

  List<String> get shortlistedJobs => _shortlistedJobs.toList();

  bool isShortlisted(String jobId) => _shortlistedJobs.contains(jobId);

  void toggleShortlist(String jobId) {
    if (_shortlistedJobs.contains(jobId)) {
      _shortlistedJobs.remove(jobId);
    } else {
      _shortlistedJobs.add(jobId);
    }
    notifyListeners();
  }

  void removeFromShortlist(String jobId) {
    _shortlistedJobs.remove(jobId);
    notifyListeners();
  }

  /// 🔹 Applied Jobs
  final Set<String> _appliedJobs = {};

  bool isApplied(String jobId) => _appliedJobs.contains(jobId);

  void markApplied(String jobId) {
    if (_appliedJobs.contains(jobId)) return;

    _appliedJobs.add(jobId);
    notifyListeners();
  }

  /// Optional: Reset applied state (if needed later)
  void resetApplication(String jobId) {
    _appliedJobs.remove(jobId);
    notifyListeners();
  }

  /// Optional: Clear all data (useful for logout)
  void clearAll() {
    _shortlistedJobs.clear();
    _appliedJobs.clear();
    notifyListeners();
  }

  List<JobModel> applyJobFilters(List<JobModel> jobs) {
    var filtered = jobs.where((job) {
      if (selectedWorkMode != null) {
        final modes = job.workMode ?? [];

        final matches = modes.any(
          (mode) =>
              mode.toLowerCase().trim() ==
              selectedWorkMode!.toLowerCase().trim(),
        );

        if (!matches) return false;
      }

      if (selectedLocation != null &&
          !(job.location?.contains(selectedLocation) ?? false)) {
        return false;
      }

      if (selectedEmploymentType != null &&
          !(job.employmentType?.contains(selectedEmploymentType) ?? false)) {
        return false;
      }

      if (selectedDegree != null &&
          !(job.degree?.contains(selectedDegree) ?? false)) {
        return false;
      }

      if (selectedCourse != null &&
          !(job.studentStreams?.contains(selectedCourse) ?? false)) {
        return false;
      }

      if (paidOnly && (job.packageDetails?.totalCTC ?? 0) <= 0) {
        return false;
      }

      return true;
    }).toList();

    return _sortJobs(filtered);
  }

  List<JobModel> _sortJobs(List<JobModel> jobs) {
    switch (_sortOption) {
      case SortOption.newestFirst:
        jobs.sort(
          (a, b) => (b.offerRolloutDate ?? DateTime(2000)).compareTo(
            a.offerRolloutDate ?? DateTime(2000),
          ),
        );
        break;

      case SortOption.oldestFirst:
        jobs.sort(
          (a, b) => (a.offerRolloutDate ?? DateTime(2000)).compareTo(
            b.offerRolloutDate ?? DateTime(2000),
          ),
        );
        break;

      case SortOption.companyNameAZ:
        jobs.sort(
          (a, b) => (a.companyName ?? "").compareTo(b.companyName ?? ""),
        );
        break;

      case SortOption.highestStipend:
        jobs.sort(
          (a, b) => (b.packageDetails?.totalCTC ?? 0).compareTo(
            a.packageDetails?.totalCTC ?? 0,
          ),
        );
        break;

      case SortOption.nearestDeadline:
        jobs.sort(
          (a, b) => (a.onlineTestDate ?? DateTime(2100)).compareTo(
            b.onlineTestDate ?? DateTime(2100),
          ),
        );
        break;
    }

    return jobs;
  }

  List<InternshipModel> applyInternshipFilters(
    List<InternshipModel> internships,
  ) {
    var filtered = internships.where((internship) {
      if (selectedWorkMode != null) {
        final modes = internship.workMode ?? [];

        final matches = modes.any(
          (mode) =>
              mode.toLowerCase().trim() ==
              selectedWorkMode!.toLowerCase().trim(),
        );

        if (!matches) return false;
      }

      if (selectedLocation != null &&
          !(internship.location?.contains(selectedLocation) ?? false)) {
        return false;
      }

      if (selectedDuration != null &&
          internship.internshipDuration != selectedDuration) {
        return false;
      }

      if (paidOnly && (internship.packageDetails?.totalCTC ?? 0) <= 0) {
        return false;
      }

      return true;
    }).toList();

    return _sortInternships(filtered);
  }

  List<InternshipModel> _sortInternships(List<InternshipModel> internships) {
    switch (_sortOption) {
      case SortOption.newestFirst:
        internships.sort(
          (a, b) => (b.onlineTestDate ?? DateTime(2000)).compareTo(
            a.onlineTestDate ?? DateTime(2000),
          ),
        );
        break;

      case SortOption.oldestFirst:
        internships.sort(
          (a, b) => (a.onlineTestDate ?? DateTime(2000)).compareTo(
            b.onlineTestDate ?? DateTime(2000),
          ),
        );
        break;

      case SortOption.companyNameAZ:
        internships.sort(
          (a, b) => (a.companyPosted?.companyDetails?.companyName ?? "")
              .compareTo(b.companyPosted?.companyDetails?.companyName ?? ""),
        );
        break;

      case SortOption.highestStipend:
        internships.sort(
          (a, b) => (b.packageDetails?.totalCTC ?? 0).compareTo(
            a.packageDetails?.totalCTC ?? 0,
          ),
        );
        break;

      case SortOption.nearestDeadline:
        internships.sort(
          (a, b) => (a.onlineTestDate ?? DateTime(2100)).compareTo(
            b.onlineTestDate ?? DateTime(2100),
          ),
        );
        break;
    }

    return internships;
  }
}
