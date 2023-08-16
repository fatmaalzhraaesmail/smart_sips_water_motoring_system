// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/login/welcome.dart';
import 'package:graduation_project/shared/network/local/cashe_helper.dart';
import 'package:graduation_project/utils/ar.dart';
import 'package:graduation_project/utils/en.dart';
import '../cubit/signup_cubic.dart';
import '../cubit/signup_state.dart';
import '../shared/component/component.dart';
import '../shared/style/color.dart';
import '../shared/style/style.dart';

enum Tab { one, two, three }

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final Tab _selectedTab = Tab.one;
  bool isHidden = true;
  void togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  List<String> list = [];
  bool? isNormalUser = false;
  bool? isKidneyPatient = false;
  bool? isFarmer = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement((context),
                    MaterialPageRoute(builder: (context) => WelcomeScreen()));
              },
              icon: Icon(Icons.arrow_back_ios_new),
              color: textColor,
            ),
          ),
          backgroundColor: Colors.white,
          body: BlocBuilder<SignUpCubit, SignState>(builder: (context, state) {
            return Column(children: [
              Image.asset(
                "image/smart sips logo.png",
                height: 160,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  SharedHelper.get(key: 'theme') == 'Light Theme'
                      ? (SharedHelper.get(key: 'lang') == 'en'
                          ? en['Welcome']!
                          : ar['Welcome']!)
                      : (SharedHelper.get(key: 'lang') == 'en'
                          ? en['Welcome']!
                          : ar['Welcome']!),
                  style: welcome,
                ),
              ),
              defaultContainer(
                  widget: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                    SizedBox(height: 64),
                    Center(
                      child: Column(children: [
                        defaultTextForm(
                            controller: userNameController,
                            hint: 'User Name',
                            obscure: false,
                            prefix: Icon(
                              Icons.person,
                              color: iconColor,
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        defaultTextForm(
                            controller: emailController,
                            hint: 'Email',
                            obscure: false,
                            prefix: Icon(
                              Icons.email,
                              color: iconColor,
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        defaultTextForm(
                          controller: password1Controller,
                          hint: 'Password',
                          obscure: isHidden ? true : false,
                          prefix: Icon(
                            Icons.lock,
                            color: iconColor,
                          ),
                          suffix: InkWell(
                            onTap: togglePasswordView,
                            child: Icon(
                              isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: iconColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        defaultTextForm(
                          controller: password2Controller,
                          hint: 'Confirm Password',
                          obscure: isHidden ? true : false,
                          prefix: Icon(
                            Icons.lock,
                            color: iconColor,
                          ),
                          suffix: InkWell(
                            onTap: togglePasswordView,
                            child: Icon(
                              isHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: iconColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 293.0,
                            height: 140.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white),
                            child: ListView(children: <Widget>[
                              ListTile(
                                title: Text(
                                  SharedHelper.get(key: 'theme') ==
                                          'Light Theme'
                                      ? (SharedHelper.get(key: 'lang') == 'en'
                                          ? en['Normal User']!
                                          : ar['Normal User']!)
                                      : (SharedHelper.get(key: 'lang') == 'en'
                                          ? en['Normal User']!
                                          : ar['Normal User']!),
                                  style: TextStyle(
                                      color: iconColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                leading: Checkbox(
                                  value: isNormalUser,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isNormalUser = value!;
                                      String selectVal = "Normal User";
                                      value
                                          ? list.add(selectVal)
                                          : list.remove(selectVal);
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  SharedHelper.get(key: 'theme') ==
                                          'Light Theme'
                                      ? (SharedHelper.get(key: 'lang') == 'en'
                                          ? en['Farmer']!
                                          : ar['Farmer']!)
                                      : (SharedHelper.get(key: 'lang') == 'en'
                                          ? en['Farmer']!
                                          : ar['Farmer']!),
                                  style: TextStyle(
                                      color: iconColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                leading: Checkbox(
                                  value: isFarmer,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isFarmer = value!;
                                      String selectVal = "Farmer";
                                      value
                                          ? list.add(selectVal)
                                          : list.remove(selectVal);
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Lab',
                                  style: TextStyle(
                                      color: iconColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                leading: Checkbox(
                                  value: isKidneyPatient,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isKidneyPatient = value!;
                                      String selectVal = "Lab";
                                      value
                                          ? list.add(selectVal)
                                          : list.remove(selectVal);
                                    });
                                  },
                                ),
                              ),
                            ])),
                        SizedBox(
                          height: 5,
                        ),
                        MaterialButton(
                          onPressed: () {
                            context.read<SignUpCubit>().SignUp(context,
                                email: emailController.text,
                                username: userNameController.text,
                                password1: password1Controller.text,
                                password2: password2Controller.text);
                          },
                          child: defaultButton(
                            color: textColor,
                            text: 'SIGN UP',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          SharedHelper.get(key: 'theme') == 'Light Theme'
                              ? (SharedHelper.get(key: 'lang') == 'en'
                                  ? en['or Social Media']!
                                  : ar['or Social Media']!)
                              : (SharedHelper.get(key: 'lang') == 'en'
                                  ? en['or Social Media']!
                                  : ar['or Social Media']!),
                          style: TextStyle(fontSize: 14, color: textColor),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            socail('image/google.png'),
                            SizedBox(
                              width: 10,
                            ),
                            socail(
                              'image/facebook.png',
                            )
                          ],
                        )
                      ]),
                    )
                  ])))
            ]);
          })),
    );
  }
}
