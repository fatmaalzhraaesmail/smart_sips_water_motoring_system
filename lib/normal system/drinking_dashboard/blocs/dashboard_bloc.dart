// ignore_for_file: unnecessary_brace_in_string_interps, unused_local_variable

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/normal%20system/cubit/state.dart';
import 'package:graduation_project/normal%20system/drinking_dashboard/repo/dashboard_repo.dart';

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class DashboardCubit extends Cubit<AppStates> {
  DashboardCubit() : super(AppInitialState());

  DashboardRepo repo = DashboardRepo();
  Future getData() async {
    emit(Loading());
    try {
      await repo.getData(usability: false, values: [
        7.26,
        77.51,
        32.55,
        81.40,
        63.55,
        1.95,
        419.68,
        68.16,
        640.00,
        1045.00,
        338.0,
        70.51
      ]);
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
  late Database database;
  List<Map> Notification = [];
  void createDatabase() {
    openDatabase(
      'SaveDrinkingWaterNotification3.db',
      version: 1,
      onCreate: (database, version) {
        print(
            'Database Created'); //only one time when created database for the first time

        database
            .execute(
                //image_name, species, description, image
                'CREATE TABLE Notification(id INTEGER PRIMARY KEY, title TEXT, body TEXT)')
            .then((value) {
          print('Table Created');
        }).catchError((error) {
          print(error.toString());
        });
      },
      onOpen: (database) {
        getDateFromDateBase(database).then((value) {
          Notification = value;
          print(Notification);
          emit(AppDrinkingGetDatabaseStates());
        });
        print('Database Opened');
      },
    ).then((value) {
      database = value;
      emit(AppDrinkingCreateDatabaseStates());
    });
  }

  insertToDatabase({
    required String title,
    required String body,
  }) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO Notification(title, body) VALUES("$title", "$body")')
          .then((value) {
        print("$value inserted sucessfully");
        emit(AppDrinkingInsertDatabaseStates());
        getDateFromDateBase(database).then((value) {
          Notification = value;
          print('Notification: ${Notification}');
          emit(AppDrinkingGetDatabaseStates());
        });
      }).catchError((error) {
        print("error when inserted new record $error.toString()");
      });
      // return null;
    });
  }
  Future<List<Map>> getDateFromDateBase(database) async {
    emit(AppDrinkingGetDatabaseLoadingStates());
    return await database.rawQuery('SELECT * FROM Notification');
  }
  void deletDate({required int id}) async {
    database
        .rawDelete('DELETE FROM Notification WHERE id= ? ', [id]).then((value) {
      // getDateFromDateBase(database);
      emit(AppDrinkingDeleteDatabaseStates());
      getDateFromDateBase(database).then((value) {
        Notification = value;
        print(Notification);
        emit(AppDrinkingGetDatabaseStates());
      });
    });
  }

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  Future<bool> sendNotificationApi(
      {required String title, required String body}) async {
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
      
      emit(NotificationHomeState());
      return true;
    } else {
      print(' CFM error');
      // on failure do sth
      emit(NotificationHomeState());

      return false;
    }
  }

  //save in database
}
