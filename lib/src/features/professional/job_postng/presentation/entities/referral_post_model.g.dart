// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferralPostModel _$ReferralPostModelFromJson(
  Map<String, dynamic> json,
) => _ReferralPostModel(
  id: json['_id'] as String?,
  jobTitle: (json['jobTitle'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  description: json['description'] as String?,
  approvalStatus: json['approvalStatus'] as String?,
  employmentType: (json['employmentType'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  workMode: (json['workMode'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  broadcastType: json['broadcastType'] as String?,
  jobType: json['jobType'] as String?,
  location: (json['location'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  minEducation: json['minEducation'] as String?,
  numberOfOpenings: (json['numberOfOpenings'] as num?)?.toInt(),
  packageDetails: json['packageDetails'] == null
      ? null
      : PackageDetails.fromJson(json['packageDetails'] as Map<String, dynamic>),
  skills: (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
  studentStreams: (json['studentStreams'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  workAuthorization: json['workAuthorization'] as String?,
  yearsOfExperience: json['yearsOfExperience'] as String?,
  minYearofExperience: json['minYearofExperience'] as String?,
  rounds: (json['rounds'] as List<dynamic>?)?.map((e) => e as String).toList(),
  selectionProcess: (json['selectionProcess'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  endDate: json['endDate'] as String?,
  inactive: json['inactive'] as bool?,
  benefits: (json['benefits'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  certifications: (json['certifications'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  eligibilityCriteria: json['eligibilityCriteria'] as String?,
  metrics: json['metrics'] == null
      ? null
      : Metrics.fromJson(json['metrics'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReferralPostModelToJson(_ReferralPostModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'jobTitle': instance.jobTitle,
      'description': instance.description,
      'approvalStatus': instance.approvalStatus,
      'employmentType': instance.employmentType,
      'workMode': instance.workMode,
      'broadcastType': instance.broadcastType,
      'jobType': instance.jobType,
      'location': instance.location,
      'minEducation': instance.minEducation,
      'numberOfOpenings': instance.numberOfOpenings,
      'packageDetails': instance.packageDetails,
      'skills': instance.skills,
      'studentStreams': instance.studentStreams,
      'tags': instance.tags,
      'workAuthorization': instance.workAuthorization,
      'yearsOfExperience': instance.yearsOfExperience,
      'minYearofExperience': instance.minYearofExperience,
      'rounds': instance.rounds,
      'selectionProcess': instance.selectionProcess,
      'endDate': instance.endDate,
      'inactive': instance.inactive,
      'benefits': instance.benefits,
      'certifications': instance.certifications,
      'eligibilityCriteria': instance.eligibilityCriteria,
      'metrics': instance.metrics,
    };

_Metrics _$MetricsFromJson(Map<String, dynamic> json) => _Metrics(
  totalApplicationsReceived: (json['totalApplicationsReceived'] as num?)
      ?.toInt(),
  totalReferredToCompany: (json['totalReferredToCompany'] as num?)?.toInt(),
  totalAcceptedByCompany: (json['totalAcceptedByCompany'] as num?)?.toInt(),
  responseRate: (json['responseRate'] as num?)?.toInt(),
  referralSuccessRate: (json['referralSuccessRate'] as num?)?.toInt(),
);

Map<String, dynamic> _$MetricsToJson(_Metrics instance) => <String, dynamic>{
  'totalApplicationsReceived': instance.totalApplicationsReceived,
  'totalReferredToCompany': instance.totalReferredToCompany,
  'totalAcceptedByCompany': instance.totalAcceptedByCompany,
  'responseRate': instance.responseRate,
  'referralSuccessRate': instance.referralSuccessRate,
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
