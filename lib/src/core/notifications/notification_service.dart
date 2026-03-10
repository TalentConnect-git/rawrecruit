import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rawrecruit/src/core/services/index.dart';

class NotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    await _flutterLocalNotificationsPlugin.initialize(settings: initSettings);

    // Request permissions
    await _fcm.requestPermission();
    String? fcmToken = await _fcm.getToken();
print("FCM TOKEN = $fcmToken");
    SharedPrefHelper.setString("deviceToken", fcmToken ?? '');
FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
  SharedPrefHelper.setString("deviceToken", newToken);
});
    // Foreground message handling
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('📩 Foreground notification: ${message.notification?.title}');

      _flutterLocalNotificationsPlugin.show(
        title: message.notification?.title,
        body: message.notification?.body,
        notificationDetails: const NotificationDetails(
          android: AndroidNotificationDetails(
            'default_channel',
            'Default Channel',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        id: message.hashCode,
      );
    });

    // When opened from background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("🔄 Opened from background");
      // Handle routing here
    });

    // When opened from terminated state
    RemoteMessage? initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      print("🚀 Opened from terminated");
      // Handle initial notification
    }
  }
}
