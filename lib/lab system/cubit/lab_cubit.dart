import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/network/local/cashe_helper.dart';
import '../bloc/lab_bloc.dart';
import '../lab.dart';
import '../lab_chat.dart';
import '../lab_notifigation.dart';
import '../lab_profile.dart';
import '../screen_page_lab.dart';
import 'lab_state.dart';


class LabCubit extends Cubit<LabStates> {
  LabCubit() : super(LabInitialState());

  static LabCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    LabPage(),
    NotivigationLabScreen(),
    ChatLabScreen(),
    ProfileLabScreen()
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(LabChangeBottomNavBarState());
  }
 
  List<String> images_Lab = [
    'image/bacteriaB.png',
    'image/bacteriaB.png',
    'image/bacteriaB.png',
    'image/bacteriaB.png'
  ];
  List<String> titles = ['device 1', 'device 2', 'device 3', 'device 4'];
  List<Widget> Dashboard_Lab = [
    BlocProvider(

      create: (conntext) => DashboardCubLad(),
      child: LabScreen(
        title: '',
      ),
    ),
   BlocProvider(
      create: (conntext) => DashboardCubLad(),

      child: LabScreen(
        title: '',
      ),
    ),
    BlocProvider(

      create: (conntext) => DashboardCubLad(),
      child: LabScreen(
        title: '',
      ),
    ),
    BlocProvider(

      create: (conntext) => DashboardCubLad(),
      child: LabScreen(
        title: '',
      ),
    ),
  ];
  // ignore: non_constant_identifier_names
  void Dashboardndex(int index) {
    currentIndex = index;
    emit(DashboardCardLabState());
  }



  dynamic myLang = SharedHelper.get(key: 'lang');

  void changeLanguage(String lang) async {
    myLang = lang;
    Get.updateLocale(Locale(lang));
    SharedHelper.save(value: lang, key: 'lang');
    emit(ChangelanguageLabState());
  }

  void navigte(context) {
    Navigator.of(context);
    emit(ChangelanguageLabState());
  }

  
}
