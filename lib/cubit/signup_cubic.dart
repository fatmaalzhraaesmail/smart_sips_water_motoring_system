
// ignore: unnecessary_import
import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubit/signup_state.dart';
import '../normal system/navigation.dart';
import '../models/auth_api.dart';
import '../shared/network/local/cashe_helper.dart';
import '../shared/style/color.dart';

class SignUpCubit extends Cubit<SignState> {
  SignUpCubit() : super(InitialUserSignState());
  Future SignUp(
    BuildContext context, {
     int pk=0,
    required String email,
    required String username,
    required String password1,
    required String password2,
  }) async {
    final user = await registerUser(
      pk,
      email,
      username,
      password1,
      password2,
    );
    print(user);
    SharedHelper.save(key: 'pk',value:pk );
    print(SharedHelper.get(key: 'pk'));

    emit(SignLoadingState());

    try {
      if (user["access_token"] != null) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return NavigationScreen();
        }));
        emit(SignSuccessState());
      }
    } catch (e) {
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
