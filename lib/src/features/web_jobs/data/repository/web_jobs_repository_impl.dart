import 'package:rawrecruit/src/features/web_jobs/data/entities/company_job.dart';

import '../../../../core/index.dart';
import '../entities/career_page_referral_response.dart';
import '../entities/career_send_model.dart';
import '../entities/web_job.dart';
import '../index.dart';

class WebJobRepositoryImpl implements WebJobRepository {
  WebJobRepositoryImpl({required WebJobDataSource webJobDataSource})
    : _webJobDataSource = webJobDataSource;

  final WebJobDataSource _webJobDataSource;

  @override
  ResultFuture<CompanyJobsDiscovery?> discoverJobs({
    required String companyName,
  }) {
    return _webJobDataSource.discoverJobs(companyName: companyName);
  }

  @override
  ResultFuture<CompanyJob?> applyToJob({required CompanyJob? job}) =>
      _webJobDataSource.applyToJob(job: job);

  @override
  ResultFuture<CareerPageReferralResponse?> requestCareerPageReferral({
    required String careerPageUrl,
  }) {
    return _webJobDataSource.requestCareerPageReferral(
      careerPageUrl: careerPageUrl,
    );
  }

  @override
  ResultFuture<CareerPageReferralSendResponse?> sendCareerPageReferral({
    required String careerPageUrl,
    required List<String> receiverUserIds,
  }) {
    return _webJobDataSource.sendCareerPageReferral(
      careerPageUrl: careerPageUrl,
      receiverUserIds: receiverUserIds,
    );
  }
}
