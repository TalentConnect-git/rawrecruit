
import 'package:rawrecruit/src/feature/revamp_dashboard/data/data_source/dashbooard_data_source.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/data/repository/dashboard_repository.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/entities/internship_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/entities/job_model.dart';

import '../../../../core/index.dart';

abstract class DashboardRepository {
  ResultFuture<List<JobModel>> getOffCampusJobs();

  ResultFuture<List<InternshipModel>> getInternships();
}
