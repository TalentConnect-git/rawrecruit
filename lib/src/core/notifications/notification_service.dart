import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_jobs/utils/enums.dart'
    show ProfessionalJobType;

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
      print('📩 Foreground Message: ${message.toMap()}');

      print('📩 Foreground Notification: ${message.notification?.toMap()}');

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

      getIt<NotificationProvider>().setNewNotificationsAvailable();
    });

    // When opened from background
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      await _handlePushNotificationData(message);
    });

    // When opened from terminated state
    RemoteMessage? initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      print("🚀 Opened from terminated");
      // Handle initial notification
    }
  }

  Future<void> _handlePushNotificationData(dynamic message) async {
    final navigatorKey = getIt<NavigationRepository>().navigatorKey;
    var notificationData = <String, dynamic>{};

    if (message is RemoteMessage) {
      notificationData = message.data;
    } else if (message is String) {
      notificationData = jsonDecode(message) as Map<String, dynamic>;
    }

    print('Notification Data: ${notificationData.toString()}');

    final state = navigatorKey.currentState;

    final topic = notificationData['topic'];
    final subtopic = notificationData['subtopic'];
    final idFromPushNotification = notificationData['id'] as String?;

    switch (topic) {
      case 'Jobs':
        switch (subtopic) {
          case 'My Posted':
            final jobId = notificationData['jobId'];

            if (jobId == null) return;

            state?.context.goNamed(
              RouteNames.application,
              extra: {
                'jobType': ProfessionalJobType.posted,
                'userType': UserType.professional,
              },
            );
            break;

          case 'JobDetail':
            final jobId = notificationData['jobId'];

            if (jobId == null) return;

            // context.pushNamed(
            //   RouteNames.jobDetail,
            //   extra: {'jobId': jobId},
            // );
            break;
        }
        break;

      case 'Job Detail':
        switch (subtopic) {
          case 'Candidates':
            final jobId = notificationData['jobId'];
            final applicationId = notificationData['applicationId'];

            if (jobId == null || applicationId == null) return;

            // context.pushNamed(
            //   RouteNames.jobCandidates,
            //   extra: {
            //     'jobId': jobId,
            //     'applicationId': applicationId,
            //   },
            // );
            break;
        }
        break;

      case 'Scheduled Interviews':
        final applicationId = notificationData['applicationId'];
        final jobId = notificationData['jobId'];

        if (applicationId == null || jobId == null) return;

        state?.context.pushNamed(RouteNames.scheduledInterviews);
        break;

      case 'Referrer':
        switch (subtopic) {
          case 'Applied By Me':
            final applicationId = notificationData['applicationId'];
            final jobId = notificationData['jobId'];

            if (applicationId == null) return;

            state?.context.goNamed(
              RouteNames.referrer,
              // extra: {'applicationId': applicationId, 'jobId': jobId},
            );
            break;
        }

        break;

      case 'Chat':
        final senderId = notificationData['senderId'];
        final referenceId = notificationData['referenceId'];

        if (senderId == null || referenceId == null) return;

        state?.context.pushNamed(
          RouteNames.chatUserList,
          // extra: {
          //   'senderId': senderId,
          //   'referenceId': referenceId,
          // },
        );
        break;
    }
  }
}
