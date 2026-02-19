// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InternshipModel _$InternshipModelFromJson(Map<String, dynamic> json) =>
    _InternshipModel(
      id: json['_id'] as String?,
      description: json['description'] as String?,
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      workMode: (json['workMode'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      location: (json['location'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      jobRoles: (json['jobRoles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      internshipDuration: json['internshipDuration'] as String?,
      numberOfOpenings: (json['numberOfOpenings'] as num?)?.toInt(),
      minEducation: json['minEducation'] as String?,
      benefits: (json['benefits'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      eligibilityCriteria: json['eligibilityCriteria'] as String?,
      onlineTestDate: json['onlineTestDate'] == null
          ? null
          : DateTime.parse(json['onlineTestDate'] as String),
      packageDetails: json['packageDetails'] == null
          ? null
          : InternshipPackageDetails.fromJson(
              json['packageDetails'] as Map<String, dynamic>,
            ),
      companyPosted: json['companyPosted'] == null
          ? null
          : InternshipCompanyPosted.fromJson(
              json['companyPosted'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$InternshipModelToJson(_InternshipModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'description': instance.description,
      'skills': instance.skills,
      'workMode': instance.workMode,
      'location': instance.location,
      'jobRoles': instance.jobRoles,
      'internshipDuration': instance.internshipDuration,
      'numberOfOpenings': instance.numberOfOpenings,
      'minEducation': instance.minEducation,
      'benefits': instance.benefits,
      'tags': instance.tags,
      'eligibilityCriteria': instance.eligibilityCriteria,
      'onlineTestDate': instance.onlineTestDate?.toIso8601String(),
      'packageDetails': instance.packageDetails,
      'companyPosted': instance.companyPosted,
    };

_InternshipPackageDetails _$InternshipPackageDetailsFromJson(
  Map<String, dynamic> json,
) => _InternshipPackageDetails(totalCTC: (json['totalCTC'] as num?)?.toInt());

Map<String, dynamic> _$InternshipPackageDetailsToJson(
  _InternshipPackageDetails instance,
) => <String, dynamic>{'totalCTC': instance.totalCTC};

_InternshipCompanyPosted _$InternshipCompanyPostedFromJson(
  Map<String, dynamic> json,
) => _InternshipCompanyPosted(
  companyDetails: json['companyDetails'] == null
      ? null
      : InternshipCompanyDetails.fromJson(
          json['companyDetails'] as Map<String, dynamic>,
        ),
  profileImageUrl: json['profileImageUrl'] as String?,
);

Map<String, dynamic> _$InternshipCompanyPostedToJson(
  _InternshipCompanyPosted instance,
) => <String, dynamic>{
  'companyDetails': instance.companyDetails,
  'profileImageUrl': instance.profileImageUrl,
};

_InternshipCompanyDetails _$InternshipCompanyDetailsFromJson(
  Map<String, dynamic> json,
) => _InternshipCompanyDetails(companyName: json['companyName'] as String?);

Map<String, dynamic> _$InternshipCompanyDetailsToJson(
  _InternshipCompanyDetails instance,
) => <String, dynamic>{'companyName': instance.companyName};
