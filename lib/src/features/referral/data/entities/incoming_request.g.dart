// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incoming_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IncomingRequest _$IncomingRequestFromJson(Map<String, dynamic> json) =>
    _IncomingRequest(
      id: json['_id'] as String?,
      currentStatus: json['currentStatus'] as String?,
      matchScore: json['matchScore'] as num?,
      createdAt: json['createdAt'] as String?,
      jobTitle: json['jobTitle'] as String?,
      applicantName: json['applicantName'] as String?,
      applicantEmail: json['applicantEmail'] as String?,
      applicantPhone: json['applicantPhone'] as String?,
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      academicBackground: json['academicBackground'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$IncomingRequestToJson(_IncomingRequest instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'currentStatus': instance.currentStatus,
      'matchScore': instance.matchScore,
      'createdAt': instance.createdAt,
      'jobTitle': instance.jobTitle,
      'applicantName': instance.applicantName,
      'applicantEmail': instance.applicantEmail,
      'applicantPhone': instance.applicantPhone,
      'skills': instance.skills,
      'academicBackground': instance.academicBackground,
    };
