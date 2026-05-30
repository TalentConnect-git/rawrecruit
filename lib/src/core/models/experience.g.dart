// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Experience _$ExperienceFromJson(Map<String, dynamic> json) => _Experience(
  company: json['company'] as String?,
  role: json['role'] as String?,
  isCurrent: json['isCurrent'] as bool?,
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$ExperienceToJson(_Experience instance) =>
    <String, dynamic>{
      'company': instance.company,
      'role': instance.role,
      'isCurrent': instance.isCurrent,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'description': instance.description,
    };
