import 'package:rawrecruit/src/feature/revamp_dashboard/entities/internship_model.dart';

import '../../../../core/index.dart';
import '../../entities/job_model.dart';

abstract class DashboardDataSource {
  ResultFuture<List<JobModel>> getOffCampusJobs();

  ResultFuture<List<InternshipModel>> getInternships();
}
