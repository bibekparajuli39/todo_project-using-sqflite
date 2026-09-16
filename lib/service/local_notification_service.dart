import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// step 1
final FlutterLocalNotificationsPlugin localNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initFlutterLocalNotification() async {
  // step 2
  const AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  // step 3
  final InitializationSettings initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
  );
  await localNotificationsPlugin.initialize(settings: initializationSettings);
  await localNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.requestNotificationsPermission();
}

Future<void> callNotification({
  required String title,
  required String body,
}) async {
  // inintialized for notification
  const android = AndroidNotificationDetails(
    "reminder_channel",
    "Reminders",
    channelDescription: 'Local Notification',
    importance: Importance.high,
    priority: Priority.high,
  );
  // detail for notification like title,body for descritpion
  const details = NotificationDetails(android: android);
  await localNotificationsPlugin.show(
    id: 0,
    title: title,
    body: body,
    notificationDetails: details,
  );
}

Future<void> getFCMToken() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? generatedFcmToken = await messaging.getToken();
  // ignore: avoid_print
  print("FMC Token $generatedFcmToken");
}
