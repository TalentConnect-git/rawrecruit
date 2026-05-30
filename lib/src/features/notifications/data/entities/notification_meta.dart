import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_meta.freezed.dart';
part 'notification_meta.g.dart';

@freezed
abstract class NotificationMeta with _$NotificationMeta {
  const factory NotificationMeta({
    String? topic,
    String? subtopic,
    Map<String, dynamic>? body,
  }) = _NotificationMeta;

  factory NotificationMeta.fromJson(Map<String, dynamic> json) =>
      _$NotificationMetaFromJson(json);
}
