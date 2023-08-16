import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/login/welcome.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {


  @override
  // ignore: no_logic_in_create_state
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
     
         () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen()))
       
        // () => Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => const WelcomeScreen()))
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(0, 255, 255, 255),
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(flex: 1, child: Image.asset('image/smart sips logo.png')),
          Expanded(
            flex: 2,
            // ignore: sized_box_for_whitespace
            child: Container(
                width: double.infinity,
                child: Image.asset(
                  'image/splash.png',
                  fit: BoxFit.fitWidth,
                )),
          )
        ],
      ),
    );
  }
}
