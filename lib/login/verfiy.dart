import 'package:flutter/material.dart';
import 'package:graduation_project/login/login.dart';
import 'package:graduation_project/login/reset_password.dart';
import 'package:graduation_project/shared/style/color.dart';
import 'package:graduation_project/shared/style/style.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerfiyPassword extends StatefulWidget {
  @override
  State<VerfiyPassword> createState() => _VerfiyPasswordState();
}

class _VerfiyPasswordState extends State<VerfiyPassword> {
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
                'Please enter the code that was sent to your email.',
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OTPTextField(
                          length: 5,
                          keyboardType: TextInputType.number,
                          spaceBetween: 4,
                          width: MediaQuery.of(context).size.width,
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldWidth: 45,
                          fieldStyle: FieldStyle.box,
                          outlineBorderRadius: 15,
                          style: TextStyle(fontSize: 17),
                          onChanged: (pin) {},
                          onCompleted: (pin) {
                            Navigator.pushReplacement(
                                (context),
                                MaterialPageRoute(
                                    builder: (context) => ResetPassword()));
                          }),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
