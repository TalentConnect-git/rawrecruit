// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyJobsDiscovery _$CompanyJobsDiscoveryFromJson(
  Map<String, dynamic> json,
) => _CompanyJobsDiscovery(
  companyName: json['companyName'] as String?,
  companySlug: json['companySlug'] as String?,
  atsType: json['atsType'] as String?,
  candidateProfileType: json['candidateProfileType'] as String?,
  candidateExperience: json['candidateExperience'] as String?,
  candidateExperienceLevel: json['candidateExperienceLevel'] as String?,
  totalFetched: (json['totalFetched'] as num?)?.toInt(),
  totalMatched: (json['totalMatched'] as num?)?.toInt(),
  jobs: (json['jobs'] as List<dynamic>?)
      ?.map((e) => CompanyJob.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CompanyJobsDiscoveryToJson(
  _CompanyJobsDiscovery instance,
) => <String, dynamic>{
  'companyName': instance.companyName,
  'companySlug': instance.companySlug,
  'atsType': instance.atsType,
  'candidateProfileType': instance.candidateProfileType,
  'candidateExperience': instance.candidateExperience,
  'candidateExperienceLevel': instance.candidateExperienceLevel,
  'totalFetched': instance.totalFetched,
  'totalMatched': instance.totalMatched,
  'jobs': instance.jobs,
};
