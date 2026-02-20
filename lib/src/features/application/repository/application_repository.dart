import 'package:rawrecruit/src/features/application/entities/application_model.dart';

import '../../../core/index.dart';

abstract class ApplicationRepository {

  ResultFuture<void> applyOffCampus({
    required String jobId,
  });

  ResultFuture<List<ApplicationModel>>
      fetchAppliedJobs(); // ✅ only one method
}