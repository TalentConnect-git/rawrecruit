import 'package:rawrecruit/src/features/dashboard/data/repository/dashboard_repository.dart';

import '../../../../core/index.dart';

enum DashboardTab { internships, jobs, referral }

enum SortOption {
  newestFirst,
  oldestFirst,
  companyNameAZ,
  highestStipend,
  nearestDeadline,
}

class DashboardViewModel extends ViewStateProvider {
  final _repository = getIt<DashboardRepository>();

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

  List<Job> applyJobFilters(List<Job> jobs) {
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

  List<Job> _sortJobs(List<Job> jobs) {
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

  List<Job> applyInternshipFilters(List<Job> internships) {
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

  List<Job> _sortInternships(List<Job> internships) {
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

  List<Job> jobs = [];
  List<Job> internships = [];
  List<User> alumni = [];
  Map<String, List<Job>> groupedAlumni = {};

  void processAlumni(List<User> list) {
    final Map<String, List<Job>> temp = {};

    for (final job in list) {
      final id = job.id ?? "";

      if (id.isEmpty) continue;

      if (temp.containsKey(id)) {
        temp[id]!.add(Job(candidatePosted: job));
      } else {
        temp[id] = [Job(candidatePosted: job)];
      }
    }

    groupedAlumni = temp;
  }

  Future<Failure?> getJobs() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _repository.getOffCampusJobs();

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (data) {
        jobs = data;
      },
    );

    setViewState(ViewState.complete);
    return failure;
  }

  Future<void> getAlumniData() async {
    final result = await _repository.getHiringAlumni(onlyPostedJob: false);

    result.fold((_) {}, (data) {
      processAlumni(data); // ✅ IMPORTANT
    });

    notifyListeners();
  }

  Future<Failure?> getInternships() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _repository.getInternships();

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (data) {
        internships = data;
      },
    );

    setViewState(ViewState.complete);
    return failure;
  }

  List<Job> referralJobs = [];
  Job? selectedReferralJob;
  Set<String> appliedReferralIds = {};

  bool isReferralApplied(String id) => appliedReferralIds.contains(id);

  Future<void> applyReferral(String id) async {
    final result = await _repository.applyReferral(id);

    result.fold((_) {}, (_) {
      appliedReferralIds.add(id);
    });

    notifyListeners();
  }

  Future<void> fetchProfessionalData() async {
    setViewState(ViewState.busy);

    final jobsResult = await _repository.getReferralJobs();

    jobsResult.fold((_) {}, (data) => referralJobs = data);

    setViewState(ViewState.complete);
    notifyListeners();
  }

  Future<void> fetchReferralJobDetails(String id) async {
    setViewState(ViewState.busy);

    final result = await _repository.getReferralJobDetails(id);

    result.fold((_) {}, (data) {
      selectedReferralJob = data;
    });

    setViewState(ViewState.complete);
    notifyListeners();
  }

  Future<void> loadDashboard() async {
    setViewState(ViewState.busy);

    notifyListeners();

    await Future.wait([
      getJobs(),
      getInternships(),
      fetchProfessionalData(), // 👈 add this if not already
    ]);

    setViewState(ViewState.idle);

    notifyListeners();
  }
}
