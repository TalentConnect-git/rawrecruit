// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Timeline _$TimelineFromJson(Map<String, dynamic> json) => _Timeline(
  start: json['start'] == null ? null : DateTime.parse(json['start'] as String),
  end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
);

Map<String, dynamic> _$TimelineToJson(_Timeline instance) => <String, dynamic>{
  'start': instance.start?.toIso8601String(),
  'end': instance.end?.toIso8601String(),
};
