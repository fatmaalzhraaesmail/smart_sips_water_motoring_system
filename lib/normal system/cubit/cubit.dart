// ignore_for_file: unused_local_variable, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation_project/normal%20system/cubit/state.dart';
import 'package:graduation_project/normal%20system/chat.dart';
import 'package:graduation_project/normal%20system/home.dart';
import 'package:graduation_project/normal%20system/notification.dart';
import 'package:graduation_project/normal%20system/profile.dart';
import 'package:graduation_project/shared/network/local/cashe_helper.dart';
import '../drinking_dashboard/blocs/dashboard_bloc.dart';
import 'package:graduation_project/normal%20system/drinking_dashboard/pages/dashboard_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    HomePage(),
    NotivigationScreen(),
    ChatScreen(),
    ProfileScreen()
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  List<String> images = [
    'image/houseB.png',
    'image/houseB.png',
    'image/houseB.png',
    'image/houseB.png'
  ];

  List<String> titles = ['device', 'device', 'device', 'device'];

  List<Widget> Dashboard_Home = [
    BlocProvider(
      create: (conntext) => DashboardCubit()..getData(),
      child: LegendOptions(),
    ),
    BlocProvider(
      create: (conntext) => DashboardCubit()..getData(),
      child: LegendOptions(),
    ),
    BlocProvider(
      create: (conntext) => DashboardCubit()..getData(),
      child: LegendOptions(),
    ),
    BlocProvider(
      create: (conntext) => DashboardCubit()..getData(),
      child: LegendOptions(),
    ),
  ];

  // ignore: non_constant_identifier_names
  void Dashboardndex(int index) {
    currentIndex = index;
    emit(DashboardCardState());
  }

  dynamic myLang = SharedHelper.get(key: 'lang');

  void changeLanguage(String lang) async {
    myLang = lang;
    Get.updateLocale(Locale(lang));
    SharedHelper.save(value: lang, key: 'lang');
    emit(ChangelanguageState());
  }

  void navigte(context) {
    Navigator.of(context);
    emit(ChangelanguageState());
  }

  int labIndex = 0;

  void LabchangeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  getUserProfileNew() async {
    var user_id = SharedHelper.get(key: 'pkk');
    var token = SharedHelper.get(key: 'access_token');
    print(token);
    final apiUrl =
        "https://smartsips-production.up.railway.app/user_api/${user_id}/userprofile/get";
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    final response = await http.get(Uri.parse(apiUrl), headers: headers);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      // List<Map<String, dynamic>> responseList = jsonDecode(jsonResponse);

// Extract information from the first Map in the List
      // Map<String, dynamic> responseMap = responseList.first;
      // Map<String, dynamic> responseMap = jsonResponse;
      final responseMap = jsonResponse[0];

      int id = responseMap['id'];
      String phoneNumber = responseMap['phone_number'] ?? '';
      String address = responseMap['address'];
      String createdAt = responseMap['created_at'];
      String username = responseMap['username'];
      String password = responseMap['password'];
      String email = responseMap['email'];
      String country = responseMap['country'];
      var res = [username, email, phoneNumber, address, country];
      print('res:${res}');
      emit(AppGetUserDataStates());
      // return userProfiles;
      return [username, email, phoneNumber, address, country];
    } else {
      print("Failed to get profile: ${response.body}");
    }
    return null;
  }
}


      // final userProfiles = List<UserProfile>.from(
      //     jsonResponse.map((profile) => UserProfile.fromJson(profile)));
      // print(userProfiles);
      // print('${userProfiles}');
      // print("Name: ${userProfiles['username']}");
      // print("Email: ${userProfiles.email}");
      // print("Phone Number: ${userProfiles.phone_number}");

      // var name = userProfile.username;
      // var email = userProfile.email;
      // var phoneNumber = userProfile.phone_number;
      // var address = userProfile.address;
      // var country = userProfile.country;
      // var image = userProfile.image;
      // return [name,email,phoneNumber,address,country,image];