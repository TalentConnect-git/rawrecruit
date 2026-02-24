// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'professional_metrics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfessionalMetricsModel _$ProfessionalMetricsModelFromJson(
  Map<String, dynamic> json,
) => _ProfessionalMetricsModel(
  totalJobsPosted: (json['totalJobsPosted'] as num?)?.toInt(),
  approvedJobs: (json['approvedJobs'] as num?)?.toInt(),
  rejectedJobs: (json['rejectedJobs'] as num?)?.toInt(),
  totalApplicationsDone: (json['totalApplicationsDone'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProfessionalMetricsModelToJson(
  _ProfessionalMetricsModel instance,
) => <String, dynamic>{
  'totalJobsPosted': instance.totalJobsPosted,
  'approvedJobs': instance.approvedJobs,
  'rejectedJobs': instance.rejectedJobs,
  'totalApplicationsDone': instance.totalApplicationsDone,
};
