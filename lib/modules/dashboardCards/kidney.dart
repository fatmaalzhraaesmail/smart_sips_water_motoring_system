import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/normal%20system/navigation.dart';
import 'package:graduation_project/normal%20system/report.dart';
import 'package:graduation_project/shared/component/component.dart';
import 'package:graduation_project/shared/style/color.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../shared/style/style.dart';

enum Tab { one, two, three }

class kidneyScreen extends StatefulWidget {
  const kidneyScreen({super.key});

  @override
  State<kidneyScreen> createState() => _kidneyScreenState();
}

class _kidneyScreenState extends State<kidneyScreen> {
  Tab _selectedTab = Tab.one;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement((context),
              MaterialPageRoute(builder: (context) => NavigationScreen())),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: textColor,
          ),
        ),
        title: Text(
          'Chart',
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        elevation: 3,
        shadowColor: textColor,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            CupertinoSegmentedControl<Tab>(
              unselectedColor: Colors.white,
              selectedColor: textColor,
              borderColor: textColor,
              children: {
                Tab.one: Text(
                  'Daily',
                  style: user,
                ),
                Tab.two: Text(
                  'Weekly',
                  style: user,
                ),
                Tab.three: Text(
                  ' Monthly',
                  style: user,
                ),
              },
              onValueChanged: (value) {
                setState(() {
                  _selectedTab = value;
                });
              },
              groupValue: _selectedTab,
            ),
            Builder(builder: (context) {
              switch (_selectedTab) {
                case Tab.one:
                  return Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset('image/element chart.png'),
                          elementContainer(
                              element: 'RSC',
                              description: 'Residual sodium carbonate',
                              description2: 'concentration is dangerous',
                              percent: 90 / 100,
                              textPercent: '90%',
                              color: Colors.red),
                              SizedBox(height: 10,),
                          elementContainer(
                              element: 'Na+',
                              description: 'Sodium conentration is good',
                              description2: '',
                              percent: 30 / 100,
                              textPercent: '30%',
                              color: Colors.green),
                                SizedBox(height: 10,),
                          elementContainer(
                              element: 'PI',
                              description: 'Process instrumentation',
                              description2: 'conentration is ubnormal',
                              percent: 60 / 100,
                              textPercent: '60%',
                              color: Colors.yellow),
                               SizedBox(height: 10,),
                          elementContainer(
                              element: 'Mg',
                              description: 'Magnesium concentration',
                              description2: 'is dangerous',
                              percent: 80 / 100,
                              textPercent: '80%',
                              color: Colors.red),
                        ],
                      ),
                    ),
                  );
                case Tab.two:
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('image/cart qw.png'),
                      SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                          onPressed: () => Navigator.pushReplacement(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => ReportScreen())),
                          child:
                              defaultButton(color: textColor, text: 'Report'))
                    ],
                  );

                case Tab.three:
                  return Center(
                    child: Image.asset('image/cart qw month.png')
                  );
              }
            })
          ],
        ),
      ),
    );
  }
}

Widget elementContainer(
        {required String element,
        required String description,
        String? description2,
        required double percent,
        required String textPercent,
        required Color color}) =>
    Container(
      width: 340,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Colors.grey,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  element,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                Text(
                  description,
                  style: TextStyle(color: textColor, fontSize: 17),
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  description2!,
                  style: TextStyle(color: textColor, fontSize: 17),
                )
              ]),
              CircularPercentIndicator(
                  radius: 30.0,
                  lineWidth: 15.0,
                  percent: percent,
                  animation: true,
                  animationDuration: 1500,
                  center: Text(textPercent),
                  progressColor: color)
            ],
          ),
        ),
      ),
    );
