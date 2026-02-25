// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Achievement _$AchievementFromJson(Map<String, dynamic> json) => _Achievement(
  id: json['_id'] as String?,
  title: json['title'] as String?,
  event: json['event'] as String?,
  date: json['date'] as String?,
);

Map<String, dynamic> _$AchievementToJson(_Achievement instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'event': instance.event,
      'date': instance.date,
    };
