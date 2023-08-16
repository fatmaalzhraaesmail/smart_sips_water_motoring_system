import 'package:flutter/material.dart';
import 'package:graduation_project/login/login.dart';
import 'package:graduation_project/login/verfiy.dart';
import 'package:graduation_project/shared/component/component.dart';
import 'package:graduation_project/shared/style/color.dart';
import 'package:graduation_project/shared/style/style.dart';

class forgetPassword extends StatefulWidget {
  @override
  State<forgetPassword> createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<forgetPassword> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: textColor,
            ),
            onPressed: () => Navigator.pushReplacement((context),
                MaterialPageRoute(builder: (context) => LogInScreen()))),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "image/smart sips logo.png",
            width: 200,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Forget Password!',
            style: welcome,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: Text(
              'Enter your email address and will Send you a link to reset your password.',
              style: TextStyle(color: Colors.grey, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70)),
                    color: background),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultTextForm(
                          controller: emailController,
                          obscure: false,
                          hint: 'Email',
                          prefix: Icon(
                            Icons.email,
                            color: iconColor,
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                          onTap: (() {
                            Navigator.pushReplacement(
                                (context),
                                MaterialPageRoute(
                                    builder: (context) => VerfiyPassword()));
                          }),
                          child: defaultButton(color: textColor, text: 'Check'))
                    ],
                  ),
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               defaultTextForm(
                  //                   controller: emailController,
                  //                   hint: 'Email',
                  //                   prefix: Icon(
                  //                     Icons.email,
                  //                     color: iconColor,
                  //                   )),
                  //               SizedBox(
                  //                 height: 50,
                  //               ),
                  //               InkWell(
                  //                   onTap: (() {
                  //                     Navigator.pushReplacement(
                  //                         (context),
                  //                         MaterialPageRoute(
                  //                             builder: (context) => VerfiyPassword()));
                  //                   }),
                  //                   child: defaultButton(color: textColor, text: 'Check'))
                  //             ],
                )),
          )
        ]),
      ),
    );
  }
}
