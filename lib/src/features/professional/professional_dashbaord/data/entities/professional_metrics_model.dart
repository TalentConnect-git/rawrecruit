import 'package:freezed_annotation/freezed_annotation.dart';

part 'professional_metrics_model.freezed.dart';
part 'professional_metrics_model.g.dart';

@freezed
abstract class ProfessionalMetricsModel with _$ProfessionalMetricsModel {
  const factory ProfessionalMetricsModel({
    int? totalJobsPosted,
    int? approvedJobs,
    int? rejectedJobs,
    int? totalApplicationsDone,
  }) = _ProfessionalMetricsModel;

  factory ProfessionalMetricsModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ProfessionalMetricsModelFromJson(json);
}