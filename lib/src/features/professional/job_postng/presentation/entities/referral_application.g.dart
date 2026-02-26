// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferralApplication _$ReferralApplicationFromJson(Map<String, dynamic> json) =>
    _ReferralApplication(
      id: json['_id'] as String?,
      applicant: json['applicant'] == null
          ? null
          : UserProfile.fromJson(json['applicant'] as Map<String, dynamic>),
      applicantType: json['applicantType'] as String?,
      adminApprovalStatus: json['adminApprovalStatus'] as String?,
      job: json['job'] == null
          ? null
          : ReferralPostModel.fromJson(json['job'] as Map<String, dynamic>),
      currentStatus: const ApplicationStatusConvertor().fromJson(
        json['currentStatus'] as String?,
      ),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ReferralApplicationToJson(
  _ReferralApplication instance,
) => <String, dynamic>{
  '_id': instance.id,
  'applicant': instance.applicant,
  'applicantType': instance.applicantType,
  'adminApprovalStatus': instance.adminApprovalStatus,
  'job': instance.job,
  'currentStatus': const ApplicationStatusConvertor().toJson(
    instance.currentStatus,
  ),
  'createdAt': instance.createdAt?.toIso8601String(),
};
