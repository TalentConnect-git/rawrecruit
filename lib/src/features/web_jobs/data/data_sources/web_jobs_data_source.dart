import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/web_jobs/data/entities/company_job.dart'
    show CompanyJob;

import '../entities/career_page_referral_response.dart';
import '../entities/web_job.dart';

abstract class WebJobDataSource {
  ResultFuture<CompanyJobsDiscovery?> discoverJobs({
    required String companyName,
  });

  ResultFuture<CompanyJob?> applyToJob({required CompanyJob? job});

  ResultFuture<CareerPageReferralResponse?> requestCareerPageReferral({
    required String careerPageUrl,
  });
}
