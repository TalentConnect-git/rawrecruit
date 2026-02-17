import 'package:flutter/material.dart';

enum DashboardTab { internships, jobs }

class DashboardProvider extends ChangeNotifier {

  /// 🔹 Selected Tab
  DashboardTab _selectedTab = DashboardTab.internships;

  DashboardTab get selectedTab => _selectedTab;

  void changeTab(DashboardTab tab) {
    if (_selectedTab == tab) return;
    _selectedTab = tab;
    notifyListeners();
  }

  /// 🔹 Shortlisted Jobs
  final Set<String> _shortlistedJobs = {};

  List<String> get shortlistedJobs =>
      _shortlistedJobs.toList();

  bool isShortlisted(String jobId) =>
      _shortlistedJobs.contains(jobId);

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

  bool isApplied(String jobId) =>
      _appliedJobs.contains(jobId);

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
}
