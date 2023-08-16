import 'package:flutter/material.dart';
import 'package:graduation_project/login/login.dart';
import 'package:graduation_project/shared/component/component.dart';
import 'package:graduation_project/shared/style/color.dart';
import 'package:graduation_project/shared/style/style.dart';

class ResetPassword extends StatefulWidget {
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                'Enter your new Password please.',
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
                            hint: 'New Password',
                            prefix: Icon(
                              Icons.email,
                              color: iconColor,
                            )),
                        SizedBox(
                          height: 50,
                        ),
                        InkWell(
                            onTap: (() {
                               Dialog(
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
                            'image/check.png',
                            width: 70,
                            height: 70,
                          ),
                          Text(
                            'The password has been changed successfully',
                            style: TextStyle(
                                color: textColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
                              );
                              Navigator.pushReplacement(
                                  (context),
                                  MaterialPageRoute(
                                      builder: (context) => LogInScreen()));
                            }),
                            child: defaultButton(
                                color: textColor, text: 'Reset Password'))
                      ],
                    ),
              
                  )),
            )
          ],
        ),
      ),
    );
  }
}
