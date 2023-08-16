import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/login/forget_password.dart';
import 'package:graduation_project/login/welcome.dart';
import 'package:graduation_project/shared/component/component.dart';
import 'package:graduation_project/shared/network/local/cashe_helper.dart';
import 'package:graduation_project/shared/style/color.dart';
import 'package:graduation_project/shared/style/style.dart';
import 'package:graduation_project/utils/ar.dart';
import 'package:graduation_project/utils/en.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import '../cubit/user_cubit.dart';
import '../cubit/user_state.dart';

bool isLogin = false;
// final facebookLogin = FacebookLogin();


enum Tab { one, two }

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isHidden = true;
  void togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
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
          body: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return Column(children: [
                Image.asset(
                  "image/smart sips logo.png",
                  height: 270,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    SharedHelper.get(key: 'theme') == 'Light Theme'
                        ? (SharedHelper.get(key: 'lang') == 'en'
                            ? en['Welcome Back!']!
                            : ar['Welcome Back!']!)
                        : (SharedHelper.get(key: 'lang') == 'en'
                            ? en['Welcome Back!']!
                            : ar['Welcome Back!']!),
                    style: welcome,
                  ),
                ),
                defaultContainer(
                    widget: SingleChildScrollView(
                        child: Column(children: [
                  SizedBox(height: 120),
                  Center(
                    child: Column(
                      children: [
                        defaultTextForm(
                            controller: emailController,
                            hint: 'email',
                            obscure: false,
                            prefix: Icon(
                              Icons.email,
                              color: iconColor,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        defaultTextForm(
                          controller: passwordController,
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
                        InkWell(
                          onTap: (() => Navigator.pushReplacement(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => forgetPassword()))),
                          child: Text(
                            SharedHelper.get(key: 'theme') == 'Light Theme'
                                ? (SharedHelper.get(key: 'lang') == 'en'
                                    ? en['Forget Your Password?']!
                                    : ar['Forget Your Password?']!)
                                : (SharedHelper.get(key: 'lang') == 'en'
                                    ? en['Forget Your Password?']!
                                    : ar['Forget Your Password?']!),
                            style: TextStyle(fontSize: 14, color: textColor),
                          ),

                        ),
                        SizedBox(
                          height: 40,
                        ),
                        MaterialButton(
                          onPressed: () {
                            context.read<UserCubit>().LogIn(context,
                                email: emailController.text,
                                password: passwordController.text);
                          },
                          child: defaultButton(
                            color: textColor,
                            text: 'SIGN IN',
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

                            MaterialButton(
                                onPressed: () {},
                                child: socail('image/google.png')),

                            SizedBox(
                              width: 10,
                            ),
                            MaterialButton(
                              onPressed: () {
                                // Navigator.of(context)
                                //     .push(MaterialPageRoute(builder: (context) {
                                //   return FaceBookScreen();
                                // }));
                              },
                              child: socail(
                                'image/facebook.png',
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ])))
              ]);
            },
          )),
    );
  }

}
