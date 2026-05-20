// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Education _$EducationFromJson(Map<String, dynamic> json) => _Education(
  college: json['college'] as String?,
  degree: json['degree'] as String?,
  specialization: json['specialization'] as String?,
  semester: json['semester'] as String?,
  cgpa: json['cgpa'] as String?,
  yearOfGraduation: json['yearOfGraduation'] as String?,
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
  educationType: json['educationType'] as String?,
  isCurrent: json['isCurrent'] as bool?,
  degreeCertificate: json['degreeCertificate'] as String?,
);

Map<String, dynamic> _$EducationToJson(_Education instance) =>
    <String, dynamic>{
      'college': instance.college,
      'degree': instance.degree,
      'specialization': instance.specialization,
      'semester': instance.semester,
      'cgpa': instance.cgpa,
      'yearOfGraduation': instance.yearOfGraduation,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'educationType': instance.educationType,
      'isCurrent': instance.isCurrent,
      'degreeCertificate': instance.degreeCertificate,
    };
