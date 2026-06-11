// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_breakdown.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScoreBreakdown _$ScoreBreakdownFromJson(Map<String, dynamic> json) =>
    _ScoreBreakdown(
      skills: (json['skills'] as num?)?.toInt(),
      role: (json['role'] as num?)?.toInt(),
      experience: (json['experience'] as num?)?.toInt(),
      location: (json['location'] as num?)?.toInt(),
      workMode: (json['workMode'] as num?)?.toInt(),
      candidateType: (json['candidateType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ScoreBreakdownToJson(_ScoreBreakdown instance) =>
    <String, dynamic>{
      'skills': instance.skills,
      'role': instance.role,
      'experience': instance.experience,
      'location': instance.location,
      'workMode': instance.workMode,
      'candidateType': instance.candidateType,
    };
