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
          : User.fromJson(json['applicant'] as Map<String, dynamic>),
      applicantType: json['applicantType'] as String?,
      adminApprovalStatus: json['adminApprovalStatus'] as String?,
      job: json['job'] == null
          ? null
          : ReferralPostModel.fromJson(json['job'] as Map<String, dynamic>),
      statusText: json['statusText'] as String?,
      currentStatus: const ApplicationStatusConvertor().fromJson(
        json['currentStatus'] as String?,
      ),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      matchScore: (json['matchScore'] as num?)?.toInt(),
      jobTitle: json['jobTitle'] as String?,
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ReferralApplicationToJson(
  _ReferralApplication instance,
) => <String, dynamic>{
  '_id': instance.id,
  'applicant': instance.applicant,
  'applicantType': instance.applicantType,
  'adminApprovalStatus': instance.adminApprovalStatus,
  'job': instance.job,
  'statusText': instance.statusText,
  'currentStatus': const ApplicationStatusConvertor().toJson(
    instance.currentStatus,
  ),
  'createdAt': instance.createdAt?.toIso8601String(),
  'matchScore': instance.matchScore,
  'jobTitle': instance.jobTitle,
  'skills': instance.skills,
};
