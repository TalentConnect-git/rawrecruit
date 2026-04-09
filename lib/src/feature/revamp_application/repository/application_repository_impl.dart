import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/feature/revamp_application/data/application_data_source.dart';
import 'package:rawrecruit/src/feature/revamp_application/entities/application_model.dart';
import 'package:rawrecruit/src/feature/revamp_application/repository/application_repository.dart';

import '../../../core/index.dart';
class ApplicationRepositoryImpl
    implements ApplicationRepository {

  final ApplicationDataSource _dataSource;

  ApplicationRepositoryImpl(this._dataSource);

  @override
  ResultFuture<void> applyOffCampus({
    required String jobId,
  }) {
    return _dataSource.applyOffCampus(
      jobId: jobId,
    );
  }

  @override
  ResultFuture<List<Job>>
      fetchAppliedJobs() {

    return _dataSource.fetchAppliedJobs();
  }
}