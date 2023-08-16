// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubit/user_state.dart';
import 'package:graduation_project/models/auth_api.dart';
import '../normal system/navigation.dart';
import '../shared/style/color.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(InitialUserState());
  void LogIn(BuildContext context,
      {required String email, required String password}) async {
    final user = await userAuth(email, password);
    emit(LoginLoadingState());
    print(user);
    try {
      log(user["access_token"]);
      if (user['access_token'] != null) {
        emit(LoginSuccessState());
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return NavigationScreen();
        }));
      }
    } catch (e) {
      emit(LoginErrorState());
      showDialog(
          context: context,
          builder: ((context) {
            return Dialog(
              backgroundColor: background,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              insetAnimationCurve: Curves.bounceIn,
              child: Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: background,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'image/warning.png',
                          width: 70,
                          height: 70,
                        ),
                        Text(
                          user,
                          style: TextStyle(
                              color: textColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
            );
          }));
    }
  }
}
