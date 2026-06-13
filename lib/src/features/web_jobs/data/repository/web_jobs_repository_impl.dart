import 'package:rawrecruit/src/features/web_jobs/data/entities/company_job.dart';

import '../../../../core/index.dart';
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
}
