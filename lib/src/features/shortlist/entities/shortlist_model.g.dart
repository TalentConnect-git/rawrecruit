// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shortlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShortlistModel _$ShortlistModelFromJson(Map<String, dynamic> json) =>
    _ShortlistModel(
      id: json['_id'] as String?,
      jobType: json['jobType'] as String?,
      currentStatus: json['currentStatus'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ShortlistModelToJson(_ShortlistModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'jobType': instance.jobType,
      'currentStatus': instance.currentStatus,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
