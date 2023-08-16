import 'package:flutter/material.dart';
import 'package:graduation_project/shared/style/color.dart';
import 'package:graduation_project/utils/ar.dart';
import 'package:graduation_project/utils/en.dart';

import '../shared/network/local/cashe_helper.dart';
import 'lab_navigation.dart';

class NotivigationLabScreen extends StatefulWidget {

  @override
  State<NotivigationLabScreen> createState() => _NotivigationLabScreenState();
}

class _NotivigationLabScreenState extends State<NotivigationLabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 3.0,
        shadowColor: textColor,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement(
              (context), MaterialPageRoute(builder: (context) => NavigationLabScreen())),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: textColor,
            size: 30,
          ),
        ),
        title: Text(
          SharedHelper.get(key: 'theme') == 'Light Theme'
              ? (SharedHelper.get(key: 'lang') == 'en'
                  ? en['Notification']!
                  : ar['Notification']!)
              : (SharedHelper.get(key: 'lang') == 'en'
                  ? en['Notification']!
                  : ar['Notification']!),
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.notifications_active,
            color: textColor,
            size: 30,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            notification(
                img: 'image/check.png',
                text1: 'The Concentration of chemical',
                text2: 'elements in the water is good.',
                text3: 'Take enough water'),
                SizedBox(height: 20,),
                 notification(
                img: 'image/abnormal.png',
                text1: 'The Concentration of Na+ in the',
                text2: ' water is abnormal.it has bad',
                text3: 'effect in your heart'),
                    SizedBox(height: 20,),
                 notification(
                img: 'image/warning.png',
                text1: 'The Concentration of',
                text2: 'microbilogical paramter in water',
                text3: 'is high. Be careful'),
          ],
        ),
      ),
    );
  }
}

Widget notification(
        {required String img,
        required String text1,
        required String text2,
        required String text3}) =>
    Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [BoxShadow(color: Colors.grey)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                img,
                height: 50,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  text2,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  text3,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ],
            ),
          ],
        ));
