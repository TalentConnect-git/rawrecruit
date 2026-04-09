import 'package:rawrecruit/src/feature/revamp_dashboard/data/repository/dashboard_repository.dart';

import '../../../../core/index.dart';

class DashboardViewModel extends ViewStateProvider {
  final _repository = getIt<DashboardRepository>();

  List<Job> jobs = [];
  List<Job> internships = [];

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

  final results = await Future.wait([
    getJobs(),
    getInternships(),
    fetchProfessionalData(), // 👈 add this if not already
  ]);

 
    setViewState(ViewState.idle);

  notifyListeners();
}
}
