import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'package:flutter_project_base/debug/log_printer.dart';
// import 'package:flutter_project_base/handlers/permission_handler.dart';
// ignore: unused_import
import 'dart:math' as math; 
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('Handling a background message ${message.data}');
}

abstract class FirebaseNotifications {
  static FirebaseMessaging? _firebaseMessaging;
  static FlutterLocalNotificationsPlugin? _flutterLocalNotificationsPlugin;
  static AndroidNotificationChannel? _channel;

  static init() async {
    print("data");
    // PermissionHandler().checkNotificationPermission();
    _channel = AndroidNotificationChannel(
        'high_importance_channel',
        'High Importance Notifications',
        importance: Importance.high,
        );
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    _firebaseMessaging = FirebaseMessaging.instance; //fast init automatic
    _firebaseMessaging!.setAutoInitEnabled(true);
    print('token: ${await _firebaseMessaging!.getToken()}');
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);
    _flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel!);
    _flutterLocalNotificationsPlugin!.initialize(const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    ));
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);
    if (Platform.isAndroid)
      // ignore: curly_braces_in_flow_control_structures
      _firebaseMessaging!.requestPermission(
          alert: true, announcement: true, badge: true, sound: true);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
            // sendFcm();

      print(message.data.toString());
      print("mm ${message.notification!.title}");
      await _flutterLocalNotificationsPlugin!.show(
        message.notification.hashCode,
        message.notification!.title,
        message.notification!.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
              _channel!.id,
              _channel!.name,
              icon: '@mipmap/ic_launcher',
              ),
        ),
      );
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Handling message open app ${message.data}');
    });
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      log('Handling initial message  ${message?.data}');
    });
    _flutterLocalNotificationsPlugin!
        .getNotificationAppLaunchDetails()
        .then((value) {
    });
  }
}
