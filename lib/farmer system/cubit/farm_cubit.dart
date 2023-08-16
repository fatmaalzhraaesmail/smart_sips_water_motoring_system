import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation_project/farmer%20system/cubit/farm_state.dart';
import 'package:graduation_project/shared/network/local/cashe_helper.dart';
import 'package:graduation_project/farmer%20system/irrigration_dashboard/blocs/dashboard_bloc.dart';
import 'package:graduation_project/farmer%20system/irrigration_dashboard/pages/dashboard_page.dart';
import '../chat_farm.dart';
import '../farm_home.dart';
import '../irrigration_dashboard/notification/notification_farm.dart';
import '../profile_farm.dart';

class FarmCubit extends Cubit<FarmStates> {
  FarmCubit() : super(FarmInitialState());

  static FarmCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    FarmPage(),
    NotifigationFarmScreen(),
    ChatFarmScreen(),
    ProfileFarmScreen()
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(FarmChangeBottomNavBarState());
  }

  List<String> images_farm = [
    'image/leavesB.png',
    'image/leavesB.png',
    'image/leavesB.png',
    'image/leavesB.png'
  ];
  List<String> titles = ['device 1', 'device 2', 'device 3', 'device 4'];

  List<Widget> Dashboard_Farm = [
    BlocProvider(
      create: (conntext) => DashboardCubitIrr()..getData(),
      child: LegendOptionsIrrigration(),
    ),
    BlocProvider(
      create: (conntext) => DashboardCubitIrr()..getData(),
      child: LegendOptionsIrrigration(),
    ),
    BlocProvider(
      create: (conntext) => DashboardCubitIrr()..getData(),
      child: LegendOptionsIrrigration(),
    ),
    BlocProvider(
      create: (conntext) => DashboardCubitIrr()..getData(),
      child: LegendOptionsIrrigration(),
    ),
  ];

  // ignore: non_constant_identifier_names
  void Dashboardndex(int index) {
    currentIndex = index;
    emit(DashboardCardFarmState());
  }

  dynamic myLang = SharedHelper.get(key: 'lang');

  void changeLanguage(String lang) async {
    myLang = lang;
    Get.updateLocale(Locale(lang));
    SharedHelper.save(value: lang, key: 'lang');
    emit(ChangelanguageFarmState());
  }

  void navigte(context) {
    Navigator.of(context);
    emit(ChangelanguageFarmState());
  }
}
