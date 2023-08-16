import 'package:flutter/material.dart';
import 'package:graduation_project/normal%20system/navigation.dart';
import 'package:graduation_project/models/user.dart';
import 'package:graduation_project/login/new_welcome.dart';
import 'package:graduation_project/shared/component/constant.dart';
// ignore: depend_on_referenced_packages
import 'package:hive_flutter/adapters.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Box>(
        future: Hive.openBox(tokenBox),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var box = snapshot.data;
            var token = box!.get("token");
            if (token != null) {
              return FutureBuilder<User?>(
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data != null) {
                        User user = snapshot.data!;
                        user.token = token;
                        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                        return NavigationScreen();
                      } else {
                        return NewWelcomeToNewUser();
                      }
                    } else {
                      return NewWelcomeToNewUser();
                    }
                  });
            } else {
              return NewWelcomeToNewUser();
            }
          } else if (snapshot.hasError) {
            return NewWelcomeToNewUser();
          } else {
            return NewWelcomeToNewUser();
          }
        });
  }
}
