// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferralJobModel _$ReferralJobModelFromJson(
  Map<String, dynamic> json,
) => _ReferralJobModel(
  id: json['_id'] as String?,
  candidatePosted: json['candidatePosted'] == null
      ? null
      : CandidatePosted.fromJson(
          json['candidatePosted'] as Map<String, dynamic>,
        ),
  minEducation: json['minEducation'] as String?,
  workAuthorization: json['workAuthorization'] as String?,
  eligibilityCriteria: json['eligibilityCriteria'] as String?,
  benefits: (json['benefits'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  numberOfOpenings: (json['numberOfOpenings'] as num?)?.toInt(),
  status: json['status'] as String?,
  jobTitle: json['jobTitle'] as String?,
  location: (json['location'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  workMode: (json['workMode'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  employmentType: (json['employmentType'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  approvalStatus: json['approvalStatus'] as String?,
  description: json['description'] as String?,
  skills: (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
  packageDetails: json['packageDetails'] == null
      ? null
      : PackageDetails.fromJson(json['packageDetails'] as Map<String, dynamic>),
  yearsOfExperience: json['yearsOfExperience'] as String?,
);

Map<String, dynamic> _$ReferralJobModelToJson(_ReferralJobModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'candidatePosted': instance.candidatePosted,
      'minEducation': instance.minEducation,
      'workAuthorization': instance.workAuthorization,
      'eligibilityCriteria': instance.eligibilityCriteria,
      'benefits': instance.benefits,
      'tags': instance.tags,
      'numberOfOpenings': instance.numberOfOpenings,
      'status': instance.status,
      'jobTitle': instance.jobTitle,
      'location': instance.location,
      'workMode': instance.workMode,
      'employmentType': instance.employmentType,
      'approvalStatus': instance.approvalStatus,
      'description': instance.description,
      'skills': instance.skills,
      'packageDetails': instance.packageDetails,
      'yearsOfExperience': instance.yearsOfExperience,
    };

_CandidatePosted _$CandidatePostedFromJson(Map<String, dynamic> json) =>
    _CandidatePosted(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      experiences: json['experiences'] as List<dynamic>?,
      jobRoles: json['jobRoles'] as List<dynamic>?,
    );

Map<String, dynamic> _$CandidatePostedToJson(_CandidatePosted instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'experiences': instance.experiences,
      'jobRoles': instance.jobRoles,
    };

_PackageDetails _$PackageDetailsFromJson(Map<String, dynamic> json) =>
    _PackageDetails(
      currency: json['currency'] as String?,
      totalCTC: (json['totalCTC'] as num?)?.toInt(),
      fixedPay: (json['fixedPay'] as num?)?.toInt(),
      joiningBonus: (json['joiningBonus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PackageDetailsToJson(_PackageDetails instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'totalCTC': instance.totalCTC,
      'fixedPay': instance.fixedPay,
      'joiningBonus': instance.joiningBonus,
    };
