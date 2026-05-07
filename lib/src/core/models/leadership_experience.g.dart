// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leadership_experience.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeadershipExperience _$LeadershipExperienceFromJson(
  Map<String, dynamic> json,
) => _LeadershipExperience(
  organization: json['organization'] as String?,
  role: json['role'] as String?,
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$LeadershipExperienceToJson(
  _LeadershipExperience instance,
) => <String, dynamic>{
  'organization': instance.organization,
  'role': instance.role,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'description': instance.description,
};
