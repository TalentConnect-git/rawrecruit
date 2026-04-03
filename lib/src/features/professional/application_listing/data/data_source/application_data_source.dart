

import 'package:rawrecruit/src/feature/revamp_application/entities/application_model.dart';

import '../../../../../core/index.dart';

abstract class ReferralApplicationDataSource {

ResultFuture<List<ApplicationModel>> getMyReferralApplications();}