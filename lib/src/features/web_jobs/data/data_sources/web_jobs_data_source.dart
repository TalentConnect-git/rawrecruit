import 'package:rawrecruit/src/core/index.dart';

import '../entities/web_job.dart';

abstract class WebJobDataSource {
  ResultFuture<CompanyJobsDiscovery?> discoverJobs({
    required String companyName,
  });
}
