import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/normal%20system/cubit/state.dart';
import 'package:graduation_project/farmer%20system/irrigration_dashboard/repo/dashboard_repo.dart';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class DashboardCubitIrr extends Cubit<AppStates> {
  DashboardCubitIrr() : super(AppInitialState());

  DashboardRepoIrr repo = DashboardRepoIrr();
  void getData() async {
    emit(Loading());
    try {

      await repo.getData(
          usability: true,
          values: [0.12, 59.2, 0.5, 39.8, 33.6, 1.8, 33.3, 1045.0, 63.379762]);
      if (repo.model != null) {
        if (repo.model!.result != null) {
          emit(Done());
        } else {
          emit(Empty());
        }
      } else {
        emit(Empty());
      }
    } catch (e) {
      emit(Error());
    }
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  Future<bool> sendNotificationApi(
      {required String title, required String body}) async {
    // ignore: unused_local_variable
    final token =
        _firebaseMessaging.getToken().then((value) => print('Token: $value'));
    const postUrl = 'https://fcm.googleapis.com/fcm/send';
    final data = {
      // "to": "cl8Nj3hQT1CBbAwLJbyZHt:APA91bEu8tcOfJruiy3bRQN8-OjFCqtxOvsB4v0rmiozmN9aJDs4Gt2rVfaMtcudarLuKP3rMxf4YNA2K8oNGsUK-8c9P8xjROYZkQHLgWvEpI0C0w3OXfjLZCLLxgnWWZTbQylClc1k",
      "to": await _firebaseMessaging.getToken(),
      "notification": {
        "title": title,
        "body": body,
      },

      "data": {
        "type": '0rder',
        "id": '28',
        "click_action": 'FLUTTER_NOTIFICATION_CLICK',
      }
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization':
          // 'key=AAAA0_8EulU:APA91bFLWm2-MvB19o_vPRzYIRinXCa0QAmJKIo0ofGOsTInvckFMsJXR9gAFy8HA3ytn-0VcDGIMQHCwNFijSW49OdwMVYoFhbC1LuzCkSibawMIq0SUPrUDNHHV1U3hrf6gPA7_m07' // 'key=YOUR_SERVER_KEY'
          'key=AAAAYrXny1g:APA91bEVDpki55AQC2heb8hKl6wP6GUEhpeh9lZsaBUJ7quFnv_hTueKpMF_EHKn2UzdZNS4x03jijqXZB54zKJ5CUVTTvrdEmx5tsrS03EXMLurq0PZaGCSLF3WYuijvvw-yFtPKHjy' // 'key=YOUR_SERVER_KEY'
    };

    final response = await http.post(Uri.parse(postUrl),
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    if (response.statusCode == 200) {
      // on success do sth
      print('test ok push CFM');
      emit(NotificationFarmState());
      return true;
    } else {
      print(' CFM error');
      // on failure do sth
      return false;
    }
  }
}
