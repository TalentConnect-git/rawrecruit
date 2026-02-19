// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobModel _$JobModelFromJson(Map<String, dynamic> json) => _JobModel(
  id: json['_id'] as String?,
  description: json['description'] as String?,
  skills: (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
  workMode: (json['workMode'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  location: (json['location'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  jobRoles: (json['jobRoles'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  degree: (json['degree'] as List<dynamic>?)?.map((e) => e as String).toList(),
  employmentType: (json['employmentType'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  studentStreams: (json['studentStreams'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  eligibilityCriteria: json['eligibilityCriteria'] as String?,
  benefits: (json['benefits'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  cgpa: (json['cgpa'] as num?)?.toInt(),
  numberOfOpenings: (json['numberOfOpenings'] as num?)?.toInt(),
  interviewWindow: json['interviewWindow'] == null
      ? null
      : InterviewWindow.fromJson(
          json['interviewWindow'] as Map<String, dynamic>,
        ),
  onlineTestDate: json['onlineTestDate'] == null
      ? null
      : DateTime.parse(json['onlineTestDate'] as String),
  offerRolloutDate: json['offerRolloutDate'] == null
      ? null
      : DateTime.parse(json['offerRolloutDate'] as String),
  packageDetails: json['packageDetails'] == null
      ? null
      : JobPackageDetails.fromJson(
          json['packageDetails'] as Map<String, dynamic>,
        ),
  companyName: json['companyName'] as String?,
);

Map<String, dynamic> _$JobModelToJson(_JobModel instance) => <String, dynamic>{
  '_id': instance.id,
  'description': instance.description,
  'skills': instance.skills,
  'workMode': instance.workMode,
  'location': instance.location,
  'jobRoles': instance.jobRoles,
  'degree': instance.degree,
  'employmentType': instance.employmentType,
  'studentStreams': instance.studentStreams,
  'eligibilityCriteria': instance.eligibilityCriteria,
  'benefits': instance.benefits,
  'tags': instance.tags,
  'cgpa': instance.cgpa,
  'numberOfOpenings': instance.numberOfOpenings,
  'interviewWindow': instance.interviewWindow,
  'onlineTestDate': instance.onlineTestDate?.toIso8601String(),
  'offerRolloutDate': instance.offerRolloutDate?.toIso8601String(),
  'packageDetails': instance.packageDetails,
  'companyName': instance.companyName,
};

_InterviewWindow _$InterviewWindowFromJson(Map<String, dynamic> json) =>
    _InterviewWindow(
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$InterviewWindowToJson(_InterviewWindow instance) =>
    <String, dynamic>{
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
    };

_JobPackageDetails _$JobPackageDetailsFromJson(Map<String, dynamic> json) =>
    _JobPackageDetails(totalCTC: (json['totalCTC'] as num?)?.toInt());

Map<String, dynamic> _$JobPackageDetailsToJson(_JobPackageDetails instance) =>
    <String, dynamic>{'totalCTC': instance.totalCTC};
