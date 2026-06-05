// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_status_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApplicationStatusHistory _$ApplicationStatusHistoryFromJson(
  Map<String, dynamic> json,
) => _ApplicationStatusHistory(
  status: json['status'] as String?,
  id: json['_id'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$ApplicationStatusHistoryToJson(
  _ApplicationStatusHistory instance,
) => <String, dynamic>{
  'status': instance.status,
  '_id': instance.id,
  'date': instance.date?.toIso8601String(),
};
