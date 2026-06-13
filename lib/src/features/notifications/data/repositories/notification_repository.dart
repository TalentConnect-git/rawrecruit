import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/notifications/index.dart';

abstract class NotificationRepository {
  ResultFuture<List<Notification>> getNotifications();

  ResultFuture<Notification?> markAsRead(String notificationId);

  ResultFuture<bool> checkForNotifications();
}
