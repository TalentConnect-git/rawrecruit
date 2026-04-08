// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_posting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobPosting _$JobPostingFromJson(Map<String, dynamic> json) => _JobPosting(
  id: json['_id'] as String?,
  profileImageUrl: json['profileImageUrl'] as String?,
  backgroundImageUrl: json['backgroundImageUrl'] as String?,
  employerDetails: json['employerDetails'] == null
      ? null
      : User.fromJson(json['employerDetails'] as Map<String, dynamic>),
  companyDetails: json['companyDetails'] == null
      ? null
      : CompanyDetail.fromJson(json['companyDetails'] as Map<String, dynamic>),
);

Map<String, dynamic> _$JobPostingToJson(_JobPosting instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'profileImageUrl': instance.profileImageUrl,
      'backgroundImageUrl': instance.backgroundImageUrl,
      'employerDetails': instance.employerDetails,
      'companyDetails': instance.companyDetails,
    };
