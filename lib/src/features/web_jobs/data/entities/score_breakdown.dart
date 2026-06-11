import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_breakdown.freezed.dart';
part 'score_breakdown.g.dart';

@freezed
abstract class ScoreBreakdown with _$ScoreBreakdown {
  const factory ScoreBreakdown({
    int? skills,
    int? role,
    int? experience,
    int? location,
    int? workMode,
    int? candidateType,
  }) = _ScoreBreakdown;

  factory ScoreBreakdown.fromJson(Map<String, dynamic> json) =>
      _$ScoreBreakdownFromJson(json);
}
