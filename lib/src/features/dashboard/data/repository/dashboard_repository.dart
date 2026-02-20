import 'package:rawrecruit/src/features/dashboard/entities/internship_model.dart';
import 'package:rawrecruit/src/features/dashboard/entities/job_model.dart';

import '../../../../core/index.dart';

abstract class DashboardRepository {
  ResultFuture<List<JobModel>> getOffCampusJobs();

  ResultFuture<List<InternshipModel>> getInternships();
}
