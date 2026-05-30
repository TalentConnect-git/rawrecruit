import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/notifications/index.dart'
    show
        JobType,
        NotificationType,
        UserOrStringConvertor,
        NotificationMeta,
        $NotificationMetaCopyWith;

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
abstract class Notification with _$Notification {
  const factory Notification({
    @JsonKey(name: '_id') String? id,
    String? recipientId,
    @UserOrStringConvertor() User? senderId,
    NotificationType? type,
    String? message,
    String? referenceId,
    String? fileUrl,
    String? fileName,
    String? eventTitle,
    String? meetingLink,
    JobType? jobType,
    @Default(false) bool? read,
    String? jobId,
    NotificationMeta? meta,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
