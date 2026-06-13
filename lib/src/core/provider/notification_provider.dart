import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/core/navigation/routes_index.dart';

class NotificationProvider extends ViewStateProvider {
  bool _newNotificationsAvailable = false;

  bool get hasNewNotifications => _newNotificationsAvailable;

  void setNewNotificationsAvailable() {
    _newNotificationsAvailable = true;
    notifyListeners();
  }

  void clearNewNotificationsAvailable() {
    _newNotificationsAvailable = false;
    notifyListeners();
  }

  Future<Failure?> checkForNewNotifications() async {
    Failure? failure;

    final result = await getIt<NotificationRepository>()
        .checkForNotifications();

    result.fold((e) => failure = APIFailure.fromException(exception: e), (r) {
      if (r) {
        setNewNotificationsAvailable();
      } else {
        clearNewNotificationsAvailable();
      }
    });

    return failure;
  }
}
