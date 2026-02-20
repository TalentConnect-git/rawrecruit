// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApplicationModel _$ApplicationModelFromJson(Map<String, dynamic> json) =>
    _ApplicationModel(
      id: json['_id'] as String?,
      currentStatus: json['currentStatus'] as String?,
      jobDetails: json['jobDetails'] == null
          ? null
          : JobDetails.fromJson(json['jobDetails'] as Map<String, dynamic>),
      companyProfile: json['companyProfile'] == null
          ? null
          : CompanyProfile.fromJson(
              json['companyProfile'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ApplicationModelToJson(_ApplicationModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'currentStatus': instance.currentStatus,
      'jobDetails': instance.jobDetails,
      'companyProfile': instance.companyProfile,
    };

_JobDetails _$JobDetailsFromJson(Map<String, dynamic> json) => _JobDetails(
  id: json['_id'] as String?,
  jobRoles: (json['jobRoles'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  location: (json['location'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  jobType: json['jobType'] as String?,
  employmentType: (json['employmentType'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  workMode: (json['workMode'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  packageDetails: json['packageDetails'] == null
      ? null
      : PackageDetails.fromJson(json['packageDetails'] as Map<String, dynamic>),
);

Map<String, dynamic> _$JobDetailsToJson(_JobDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'jobRoles': instance.jobRoles,
      'location': instance.location,
      'jobType': instance.jobType,
      'employmentType': instance.employmentType,
      'workMode': instance.workMode,
      'packageDetails': instance.packageDetails,
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

_CompanyProfile _$CompanyProfileFromJson(Map<String, dynamic> json) =>
    _CompanyProfile(
      companyDetails: json['companyDetails'] == null
          ? null
          : CompanyDetails.fromJson(
              json['companyDetails'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CompanyProfileToJson(_CompanyProfile instance) =>
    <String, dynamic>{'companyDetails': instance.companyDetails};

_CompanyDetails _$CompanyDetailsFromJson(Map<String, dynamic> json) =>
    _CompanyDetails(companyName: json['companyName'] as String?);

Map<String, dynamic> _$CompanyDetailsToJson(_CompanyDetails instance) =>
    <String, dynamic>{'companyName': instance.companyName};
