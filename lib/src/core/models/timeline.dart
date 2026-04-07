import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline.freezed.dart';
part 'timeline.g.dart';

@freezed
abstract class Timeline with _$Timeline {
  const factory Timeline({DateTime? start, DateTime? end}) = _Timeline;

  factory Timeline.fromJson(Map<String, dynamic> json) =>
      _$TimelineFromJson(json);
}
