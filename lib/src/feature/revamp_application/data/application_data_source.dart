import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/entities/application_model.dart';
abstract class ApplicationDataSource {

  ResultFuture<void> applyOffCampus({
    required String jobId,
  });

  ResultFuture<List<ApplicationModel>>
      fetchAppliedJobs();
}