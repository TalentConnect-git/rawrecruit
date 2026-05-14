import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/data/repository/dashboard_repository.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/data/entities/professional_metrics_model.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/data/entities/referral_job_model.dart';

import '../../data/repository/prof_dashboard_repository.dart';

class ProfessionalViewModel extends ViewStateProvider {
  final _repository = GetIt.instance<ProfessionalRepository>();

  ProfessionalMetricsModel? metrics;

  final List<User> _companySource = [];
  Map<String, List<Job>> companyAlumni = {};

  List<ReferralJobModel> referralJobs = [];
  ReferralJobModel? selectedReferralJob;
  Set<String> appliedReferralIds = {};

  bool _isFetchingAlumni = false;
  bool get isFetchingAlumni => _isFetchingAlumni;
  set isFetchingAlumni(bool value) {
    _isFetchingAlumni = value;
    notifyListeners();
  }

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

    final metricsResult = await _repository.getMetrics();

    final jobsResult = await _repository.getReferralJobs();

    metricsResult.fold((_) {}, (data) => metrics = data);

    jobsResult.fold((_) {}, (data) => referralJobs = data);

    setViewState(ViewState.complete);
    notifyListeners();
  }

  Future<void> fetchReferralJobDetails(String id) async {
    setViewState(ViewState.busy);

    final result = await _repository.getReferralJobDetails(id);

   result.fold(
  (failure) {
  print(failure.toString());
},
  (data) async {
    try {
      log("REFERRAL DATA: $data");

      selectedReferralJob = data;

      log("SELECTED REFERRAL SET");

      final companyName =
          data.candidatePosted
                  ?.currentCompany
                  ?.trim() ??
              '';

      log("Company Name: $companyName");

      if (companyName.isNotEmpty) {
        await fetchCompanyAlumni(companyName);
      } else {
        log("Company Name: Not Found");
      }

      log("FETCH REFERRAL SUCCESS");
    } catch (e, s) {
      log("REFERRAL CRASH: $e");
      log(s.toString());
    }
  },
);

    setViewState(ViewState.complete);
    notifyListeners();
  }

  Future<void> fetchCompanyAlumni(String companyName) async {
    isFetchingAlumni = true;

    final result = await getIt<DashboardRepository>().getAlumniByCompany(
      companyName: companyName,
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
