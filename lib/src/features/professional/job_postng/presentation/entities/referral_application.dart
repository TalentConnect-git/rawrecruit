import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/features/onboarding/data/entities/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/utils/convertors.dart';
import 'package:rawrecruit/src/features/professional/job_postng/utils/enum.dart';

part 'referral_application.freezed.dart';
part 'referral_application.g.dart';

@freezed
abstract class ReferralApplication with _$ReferralApplication {
  const factory ReferralApplication({
    @JsonKey(name: '_id') String? id,
    UserProfile? applicant,
    String? applicantType,
    String? adminApprovalStatus,
    ReferralPostModel? job,
    @ApplicationStatusConvertor() ApplicationStatus? currentStatus,
    DateTime? createdAt,
  }) = _ReferralApplication;

  factory ReferralApplication.fromJson(Map<String, dynamic> json) =>
      _$ReferralApplicationFromJson(json);
}
