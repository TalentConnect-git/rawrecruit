import 'package:rawrecruit/src/core/index.dart';

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
}
