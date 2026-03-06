import 'package:rawrecruit/src/core/network/typedef.dart';
import 'package:rawrecruit/src/features/notifications/index.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  const NotificationRepositoryImpl(this._notificationDataSource);

  final NotificationDataSource _notificationDataSource;

  @override
  ResultFuture<List<Notification>> getNotifications() =>
      _notificationDataSource.getNotifications();

  @override
  ResultFuture<Notification?> markAsRead(String notificationId) =>
      _notificationDataSource.markAsRead(notificationId);
}
