// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyJob _$CompanyJobFromJson(Map<String, dynamic> json) => _CompanyJob(
  companySlug: json['companySlug'] as String?,
  companyName: json['companyName'] as String?,
  companyNormalized: json['companyNormalized'] as String?,
  title: json['title'] as String?,
  jobUrl: json['jobUrl'] as String?,
  applyUrl: json['applyUrl'] as String?,
  location: json['location'] as String?,
  workMode: json['workMode'] as String?,
  department: json['department'] as String?,
  jdSnippet: json['jdSnippet'] as String?,
  description: json['description'] as String?,
  requiredSkills: (json['requiredSkills'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  matchedSkills: (json['matchedSkills'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  missingSkills: (json['missingSkills'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  experienceRequired: json['experienceRequired'] as String?,
  salaryRange: json['salaryRange'] as String?,
  postedDate: json['postedDate'] as String?,
  jobId: json['jobId'] as String?,
  atsSource: json['atsSource'] as String?,
  matchScore: (json['matchScore'] as num?)?.toInt(),
  scoreBreakdown: json['scoreBreakdown'] == null
      ? null
      : ScoreBreakdown.fromJson(json['scoreBreakdown'] as Map<String, dynamic>),
  alumniCount: (json['alumniCount'] as num?)?.toInt(),
  totalEmployeeCount: (json['totalEmployeeCount'] as num?)?.toInt(),
  onboardingId: json['onboardingId'] as String?,
  referralRequested: json['referralRequested'] as bool?,
);

Map<String, dynamic> _$CompanyJobToJson(_CompanyJob instance) =>
    <String, dynamic>{
      'companySlug': instance.companySlug,
      'companyName': instance.companyName,
      'companyNormalized': instance.companyNormalized,
      'title': instance.title,
      'jobUrl': instance.jobUrl,
      'applyUrl': instance.applyUrl,
      'location': instance.location,
      'workMode': instance.workMode,
      'department': instance.department,
      'jdSnippet': instance.jdSnippet,
      'description': instance.description,
      'requiredSkills': instance.requiredSkills,
      'matchedSkills': instance.matchedSkills,
      'missingSkills': instance.missingSkills,
      'experienceRequired': instance.experienceRequired,
      'salaryRange': instance.salaryRange,
      'postedDate': instance.postedDate,
      'jobId': instance.jobId,
      'atsSource': instance.atsSource,
      'matchScore': instance.matchScore,
      'scoreBreakdown': instance.scoreBreakdown,
      'alumniCount': instance.alumniCount,
      'totalEmployeeCount': instance.totalEmployeeCount,
      'onboardingId': instance.onboardingId,
      'referralRequested': instance.referralRequested,
    };
