// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_page_referral_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CareerPageReferralData _$CareerPageReferralDataFromJson(
  Map<String, dynamic> json,
) => _CareerPageReferralData(
  companyName: json['companyName'] as String?,
  careerPageUrl: json['careerPageUrl'] as String?,
  sourceType: json['sourceType'] as String?,
  alumniFound: json['alumniFound'] as bool?,
  totalAlumniFound: (json['totalAlumniFound'] as num?)?.toInt() ?? 0,
  totalRequestsSent: (json['totalRequestsSent'] as num?)?.toInt() ?? 0,
  alumni:
      (json['alumni'] as List<dynamic>?)
          ?.map((e) => ReferralAlumni.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  requests:
      (json['requests'] as List<dynamic>?)
          ?.map((e) => ReferralRequest.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CareerPageReferralDataToJson(
  _CareerPageReferralData instance,
) => <String, dynamic>{
  'companyName': instance.companyName,
  'careerPageUrl': instance.careerPageUrl,
  'sourceType': instance.sourceType,
  'alumniFound': instance.alumniFound,
  'totalAlumniFound': instance.totalAlumniFound,
  'totalRequestsSent': instance.totalRequestsSent,
  'alumni': instance.alumni,
  'requests': instance.requests,
};
