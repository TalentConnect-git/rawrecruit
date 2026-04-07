// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'award.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Award _$AwardFromJson(Map<String, dynamic> json) => _Award(
  id: json['_id'] as String?,
  title: json['title'] as String?,
  organization: json['organization'] as String?,
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$AwardToJson(_Award instance) => <String, dynamic>{
  '_id': instance.id,
  'title': instance.title,
  'organization': instance.organization,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'description': instance.description,
};
