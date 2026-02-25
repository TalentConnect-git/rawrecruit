// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferralPostModel _$ReferralPostModelFromJson(
  Map<String, dynamic> json,
) => _ReferralPostModel(
  id: json['_id'] as String?,
  jobTitle: json['jobTitle'] as String?,
  description: json['description'] as String?,
  approvalStatus: json['approvalStatus'] as String?,
  employmentType: const StringOrListConvertor().fromJson(
    json['employmentType'],
  ),
  workMode: const StringOrListConvertor().fromJson(json['workMode']),
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
  benefits: (json['benefits'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  certifications: (json['certifications'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  eligibilityCriteria: json['eligibilityCriteria'] as String?,
);

Map<String, dynamic> _$ReferralPostModelToJson(_ReferralPostModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'jobTitle': instance.jobTitle,
      'description': instance.description,
      'approvalStatus': instance.approvalStatus,
      'employmentType': const StringOrListConvertor().toJson(
        instance.employmentType,
      ),
      'workMode': const StringOrListConvertor().toJson(instance.workMode),
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
      'benefits': instance.benefits,
      'certifications': instance.certifications,
      'eligibilityCriteria': instance.eligibilityCriteria,
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
