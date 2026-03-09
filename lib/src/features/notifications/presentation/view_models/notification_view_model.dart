import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/notifications/index.dart';

class NotificationViewModel extends ViewStateProvider {
  final NotificationRepository _repository = getIt<NotificationRepository>();

  List<Notification> _notifications = [];
  List<Notification> get notifications => _notifications;
  set notifications(List<Notification> notification) {
    _notifications = notification;
    notifyListeners();
  }

  Future<Failure?> getNotifications() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _repository.getNotifications();

    result.fold(
      (e) {
        failure = APIFailure.fromException(exception: e);
      },
      (r) {
        notifications = r;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }

  Future<Failure?> markAsRead(String notificationId) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _repository.markAsRead(notificationId);

    result.fold(
      (e) {
        failure = APIFailure.fromException(exception: e);
      },
      (r) async {
        await getNotifications();
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
}
