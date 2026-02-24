import 'package:get_it/get_it.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/data/entities/professional_metrics_model.dart';
import 'package:rawrecruit/src/features/professional/professional_dashbaord/data/entities/referral_job_model.dart';

import '../../data/repository/prof_dashboard_repository.dart';

class ProfessionalViewModel extends ViewStateProvider {
  final _repository = GetIt.instance<ProfessionalRepository>();

  ProfessionalMetricsModel? metrics;

  List<ReferralJobModel> referralJobs = [];
  ReferralJobModel? selectedReferralJob;
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

    result.fold((_) {}, (data) {
      selectedReferralJob = data;
    });

    setViewState(ViewState.complete);
    notifyListeners();
  }
}
