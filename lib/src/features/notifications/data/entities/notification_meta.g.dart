// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationMeta _$NotificationMetaFromJson(Map<String, dynamic> json) =>
    _NotificationMeta(
      topic: json['topic'] as String?,
      subtopic: json['subtopic'] as String?,
      body: json['body'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$NotificationMetaToJson(_NotificationMeta instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'subtopic': instance.subtopic,
      'body': instance.body,
    };
