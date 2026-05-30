import 'package:freezed_annotation/freezed_annotation.dart';

part 'international_experience.freezed.dart';
part 'international_experience.g.dart';

@freezed
abstract class InternationalExperience
    with _$InternationalExperience {

  const factory InternationalExperience({
    String? organization,
    String? country,
    String? role,
    String? startDate,
    String? endDate,
    String? description,
  }) = _InternationalExperience;

  factory InternationalExperience.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$InternationalExperienceFromJson(json);
}