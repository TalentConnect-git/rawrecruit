import 'package:freezed_annotation/freezed_annotation.dart';

part 'leadership_experience.freezed.dart';
part 'leadership_experience.g.dart';

@freezed
abstract class LeadershipExperience
    with _$LeadershipExperience {

  const factory LeadershipExperience({
    String? organization,
    String? role,
    String? startDate,
    String? endDate,
    String? description,
  }) = _LeadershipExperience;

  factory LeadershipExperience.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$LeadershipExperienceFromJson(json);
}