// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'international_experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InternationalExperience _$InternationalExperienceFromJson(
  Map<String, dynamic> json,
) => _InternationalExperience(
  country: json['country'] as String?,
  role: json['role'] as String?,
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$InternationalExperienceToJson(
  _InternationalExperience instance,
) => <String, dynamic>{
  'country': instance.country,
  'role': instance.role,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'description': instance.description,
};
