import 'package:flutter/material.dart';
import 'package:graduation_project/shared/component/component.dart';

import '../modules/dashboardCards/kidney.dart';
import '../shared/style/color.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement((context),
              MaterialPageRoute(builder: (context) => kidneyScreen())),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: textColor,
          ),
        ),
        title: Text(
          'Report',
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        elevation: 3,
        shadowColor: textColor,
      ),
      backgroundColor: background,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Image.asset('image/report table.png'),
            ),
            defaultButton(color: textColor, text: 'Refresh')
          ],
        ),
      ),
    );
  }
}
