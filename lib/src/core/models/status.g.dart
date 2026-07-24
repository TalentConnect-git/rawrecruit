// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Status _$StatusFromJson(Map<String, dynamic> json) => _Status(
  type: json['type'] as String?,
  since: json['since'] == null ? null : DateTime.parse(json['since'] as String),
  note: json['note'] as String? ?? '',
  expectedReturn: json['expectedReturn'] == null
      ? null
      : DateTime.parse(json['expectedReturn'] as String),
);

Map<String, dynamic> _$StatusToJson(_Status instance) => <String, dynamic>{
  'type': instance.type,
  'since': instance.since?.toIso8601String(),
  'note': instance.note,
  'expectedReturn': instance.expectedReturn?.toIso8601String(),
};
