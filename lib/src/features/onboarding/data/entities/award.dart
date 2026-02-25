import 'package:freezed_annotation/freezed_annotation.dart';

part 'award.freezed.dart';
part 'award.g.dart';

@freezed
abstract class Award with _$Award {
  factory Award({
    @JsonKey(name: '_id') String? id,
    String? title,
    String? organization,
    String? startDate,
    String? endDate,
    String? description,
  }) = _Award;

  factory Award.fromJson(Map<String, dynamic> json) => _$AwardFromJson(json);
}
