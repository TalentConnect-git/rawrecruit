import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/notifications/index.dart';

class NotificationDataSourceImpl implements NotificationDataSource {
  final NetworkService networkService = NetworkService();

  @override
  ResultFuture<List<Notification>> getNotifications() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.apiNotifications,
      isSafeRoute: true,
    );

    try {
      final result = await networkService.request(request);
      final response = result.data as List<dynamic>;

      if (response.isNotEmpty) {
        final notifications = response
            .map((r) => Notification.fromJson(r as Map<String, dynamic>))
            .toList();

        return Right(notifications);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right([]);
  }

  @override
  ResultFuture<Notification?> markAsRead(String notificationId) async {
    final request = Request(
      method: RequestMethod.patch,
      endpoint: '${Endpoints.apiNotifications}/$notificationId/read',
      isSafeRoute: true,
    );

    try {
      final result = await networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      if (response.isNotEmpty) {
        final notification = Notification.fromJson(response);
        return Right(notification);
      }
    } catch (e) {
      return Left(APIException.from(e));
    }

    return Right(null);
  }
}
