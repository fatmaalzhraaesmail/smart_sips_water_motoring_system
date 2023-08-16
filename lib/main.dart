// ignore_for_file: prefer_const_declarations

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:graduation_project/login/splash.dart';
import 'package:graduation_project/themes/manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'cubit/cubit_observer.dart';
import 'layout/firebase_notification_handler.dart';
import 'shared/network/local/cashe_helper.dart';

ThemeManager themeManager = ThemeManager();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp();
  await FirebaseNotifications.init();
  Bloc.observer = MyBlocObserver();

  // var token = await FirebaseMessaging.instance.getToken();
  // print("token: $token");
  // var keyy =
  //     'AAAAwcdB6sQ:APA91bGfMHeCyx8BYkbgiy_ErmkUUpw94i4RR8avLZsfY-J7PEgYQqUjREgcvzbmzI7xcMyisRQTWABsiyFyHjUP49blhqkAMcEMlZABza5MrP5zI384egG-8QDrjORhBg6DR6G5d4oH';
  // sendFcm() async {
  //   final postUrl = 'https://fcm.googleapis.com/fcm/send';

  // final data = {
  //   "notification": {"body": "this is a body", "title": "this is a title"},
  //   "priority": "high",
  //   "data": {
  //     "click_action": "FLUTTER_NOTIFICATION_CLICK",
  //     "id": "1",
  //     "status": "done"
  //   },
  //   "to": token
  // };
  //   Map<String, dynamic> data = {
  //     "to": '$token',
  //     "notification": {
  //       "body": "this is a fatma",
  //       "title": "this is a title",
  //       "sound": "default"
  //     },
  //     "android": {
  //       "priority": "high",
  //       "notification": {
  //         "notification_priority": "PRIORITY_MAX",
  //         "sound": "default",
  //         "default_sound": true,
  //         "default_vibrate_timings": true,
  //         "default_light_settings": true
  //       }
  //     },
  //     "data": {
  //       "type": "order",
  //       "id": "1",
  //       "click_action": "FLUTTER_NOTIFICATION_CLICK"
  //     }
  //   };
  //   final headers = <String, String>{
  //     'Content-Type': 'application/json',
  //     'Authorization': 'key=$keyy'
  //   };

  //   final response = await http.post(Uri.parse(postUrl),
  //       body: json.encode(data),
  //       encoding: Encoding.getByName('utf-8'),
  //       headers: headers);

  //   if (response.statusCode == 200) {
  //     // on success do sth
  //     return true;
  //   } else {
  //     // on failure do sth
  //     return false;
  //   }
  // }
  // sendFcm();

//   FirebaseMessaging.onMessage.listen((event) {
//     print('on message');
//     print(event.data.toString());
//   });
//   FirebaseMessaging.onMessageOpenedApp.listen((event) {

//     print('on opened message');
//     print(event.data.toString());
//   });
// final FirebaseMessaging messaging = FirebaseMessaging.instance;
// NotificationSettings settings = await messaging.requestPermission(
//   alert: true,
//   badge: true,
//   sound: true,
// );
  //  FirebaseMessaging.onBackgroundMessage( firebaseMessagingBackgroundHandler);

  await SharedHelper.init();
  if (SharedHelper.get(key: 'theme') == null) {
    SharedHelper.save(value: 'Dark Theme', key: 'theme');
  }
  if (SharedHelper.get(key: 'lang') == null) {
    SharedHelper.save(value: 'en', key: 'lang');
  }
  runApp(Phoenix(
    child: GraduationProject(),
  ));
}

class GraduationProject extends StatefulWidget {
  @override
  State<GraduationProject> createState() => _GraduationProjectState();
}

class _GraduationProjectState extends State<GraduationProject> {
  @override
  void dispose() {
    themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: NavigationScreen(),
          home: SplashScreen(),
      // home: NavigationScreen(),
    
    );
  }
}
// Widget startScreen() {
//   bool? signIn = SharedHelper.get(key: 'signIn');
//   if (signIn != null && signIn == true) {
//     return SplashScreen('home');
//   }
//   return SplashScreen('logIn');
// }