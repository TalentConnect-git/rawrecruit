import 'package:rawrecruit/src/features/application/data/entities/application_model.dart';

import '../../../../../core/index.dart';

abstract class ReferralApplicationRepository {
  ResultFuture<List<ApplicationModel>> getMyReferralApplications();
}
