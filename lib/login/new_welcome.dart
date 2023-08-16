import 'package:flutter/material.dart';
import 'package:graduation_project/login/login.dart';
import 'package:graduation_project/login/signup.dart';
import 'package:graduation_project/shared/component/component.dart';
import '../shared/network/local/cashe_helper.dart';
import '../shared/style/color.dart';
import '../shared/style/style.dart';
import '../utils/ar.dart';
import '../utils/en.dart';

class NewWelcomeToNewUser extends StatefulWidget {
  const NewWelcomeToNewUser({super.key});

  @override
  State<NewWelcomeToNewUser> createState() => _NewWelcomeToNewUserState();
}

class _NewWelcomeToNewUserState extends State<NewWelcomeToNewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Image.asset('image/welcom img.png'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  SharedHelper.get(key: 'theme') == 'Light Theme'
                      ? (SharedHelper.get(key: 'lang') == 'en'
                          ? en['Welcome!']!
                          : ar['Welcome!']!)
                      : (SharedHelper.get(key: 'lang') == 'en'
                          ? en['Welcome!']!
                          : ar['Welcome!']!),
                  style: welcome,
                ),
                Text(
                    SharedHelper.get(key: 'theme') == 'Light Theme'
                        ? (SharedHelper.get(key: 'lang') == 'en'
                            ? en[
                                'Smart Sips app is used for monitoring the quality of your water to safe your heath from diseases.']!
                            : ar[
                                'Smart Sips app is used for monitoring the quality of your water to safe your heath from diseases.']!)
                        : (SharedHelper.get(key: 'lang') == 'en'
                            ? en[
                                'Smart Sips app is used for monitoring the quality of your water to safe your heath from diseases.']!
                            : ar[
                                'Smart Sips app is used for monitoring the quality of your water to safe your heath from diseases.']!),
                    style: text),
                Text(
                  SharedHelper.get(key: 'theme') == 'Light Theme'
                      ? (SharedHelper.get(key: 'lang') == 'en'
                          ? en['choose one for next step']!
                          : ar['choose one for next step']!)
                      : (SharedHelper.get(key: 'lang') == 'en'
                          ? en['choose one for next step']!
                          : ar['choose one for next step']!),
                  style: text,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Flexible(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(170),
                  )),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () => Navigator.pushReplacement(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen())),
                      child: defaultButton(
                        text: "SIGN UP",
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      onPressed: () => Navigator.pushReplacement(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => LogInScreen())),
                      child: Container(
                          width: 253,
                          height: 49,
                          decoration: BoxDecoration(
                              color: textColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Column(
                              children: [
                                defaultButton(
                                    text: "SIGN IN",
                                    color: Colors.white,
                                    sign: textColor),
                              ],
                            ),
                          )),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
