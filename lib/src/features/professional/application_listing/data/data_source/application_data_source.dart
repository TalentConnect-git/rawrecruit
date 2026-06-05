import 'package:rawrecruit/src/features/application/data/entities/application_model.dart';

import '../../../../../core/index.dart';

abstract class ReferralApplicationDataSource {
  ResultFuture<List<ApplicationModel>> getMyReferralApplications();
}
