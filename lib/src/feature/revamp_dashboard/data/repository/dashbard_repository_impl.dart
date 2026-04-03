
import 'package:rawrecruit/src/feature/revamp_dashboard/data/data_source/dashbooard_data_source.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/data/repository/dashboard_repository.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/entities/internship_model.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/entities/job_model.dart';

import '../../../../core/index.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  DashboardRepositoryImpl({required DashboardDataSource dataSource})
    : _dataSource = dataSource;

  final DashboardDataSource _dataSource;

  @override
  ResultFuture<List<JobModel>> getOffCampusJobs() =>
      _dataSource.getOffCampusJobs();

  @override
  ResultFuture<List<InternshipModel>> getInternships() =>
      _dataSource.getInternships();
}
