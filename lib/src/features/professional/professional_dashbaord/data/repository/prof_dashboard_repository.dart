import '../../../../../core/index.dart';
import '../entities/professional_metrics_model.dart';
import '../entities/referral_job_model.dart';

abstract class ProfessionalRepository {
  ResultFuture<ProfessionalMetricsModel> getMetrics();
  ResultFuture<List<ReferralJobModel>> getReferralJobs();
  ResultFuture<ReferralJobModel> getReferralJobDetails(String id);
  ResultFuture<void> applyReferral(String referralId);
}