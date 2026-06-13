import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/web_jobs/data/entities/company_job.dart'
    show CompanyJob;

import '../entities/web_job.dart';

abstract class WebJobRepository {
  ResultFuture<CompanyJobsDiscovery?> discoverJobs({
    required String companyName,
  });

  ResultFuture<CompanyJob?> applyToJob({required CompanyJob? job});
}
