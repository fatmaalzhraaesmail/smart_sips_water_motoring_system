import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/lab%20system/cubit/lab_cubit.dart';
import 'package:graduation_project/lab%20system/cubit/lab_state.dart';

import 'package:graduation_project/shared/component/component.dart';
import 'package:graduation_project/shared/network/local/cashe_helper.dart';
import 'package:graduation_project/shared/style/color.dart';
import 'package:graduation_project/utils/ar.dart';
import 'package:graduation_project/utils/en.dart';

import '../../farmer system/farm_home.dart';
import '../../normal system/home.dart';

class LabPage extends StatefulWidget {
  @override
  State<LabPage> createState() => _HomePageState();
}

class _HomePageState extends State<LabPage> {
  int selectedItem=2;
  bool isdark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: textColor,
        actions: [Image.asset('image/logo in bar.png')],
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 1,
              child: Image.asset(
                'image/welcom img.png',
                fit: BoxFit.fitWidth,
              )),
          Expanded(
            flex: 2,
            // ignore: sized_box_for_whitespace
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 125.0, top: 22.0, bottom: 18.0),
                    child: Row(
                      children: [
                        Container(
                            width: 30,
                            height: 30,
                            child: Image.asset('image/device.png')),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          // 'Dashboards',
                          SharedHelper.get(key: 'theme') == 'Light Theme'
                              ? (SharedHelper.get(key: 'lang') == 'en'
                                  ? en['Devices']!
                                  : ar['Devices']!)
                              : (SharedHelper.get(key: 'lang') == 'en'
                                  ? en['Devices']!
                                  : ar['Devices']!),

                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  BlocProvider(
                    create: (BuildContext context) => LabCubit(),
                    child: BlocConsumer<LabCubit, LabStates>(
                        listener: (BuildContext context, LabStates state) {},
                        builder: (BuildContext context, LabStates state) {
                          LabCubit cubit = LabCubit.get(context);
                          return Container(
                              height: 290,
                              padding: EdgeInsets.all(12.0),
                              child: GridView.builder(
                                // itemCount: images.length,
                                itemCount: cubit.images_Lab.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 3 / 2,
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 18.0,
                                        mainAxisSpacing: 18.0),
                                itemBuilder: (BuildContext context, int index) {
                                  return DashBoardCard(cubit.images_Lab[index],
                                      cubit.titles[index], () {
                                    Navigator.pushReplacement(
                                        (context),
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                cubit.Dashboard_Lab[index]));
                                  });
                                },
                              ));
                        }),
                  ),
                ],
              ),
            ),
          )
        ],
      ),

      //drawer
      drawer: Drawer(
          backgroundColor: textColor,
          child: ListView(children: [
            ListTile(
              leading: Icon(
                Icons.list_sharp,
                color: Colors.white,
                size: 45,
              ),
            ),
            ListTile(
              selectedTileColor: selectedItem == 0 ? Colors.white : textColor,
              selected: selectedItem == 0 ? true : false,
              selectedColor: Colors.white,
              leading: selectedItem == 0
                  ? Image.asset(
                'image/houseB.png',
                width: 45,
              )
                  : Image.asset(
                'image/houseW.png',
                width: 45,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                    fontSize: 23,
                    color: selectedItem == 0 ? textColor : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  selectedItem = 0;
                });
                Navigator.pop(context);
                Navigator.pushReplacement((context),
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              selectedTileColor: selectedItem == 1 ? Colors.white : textColor,
              selected: selectedItem == 1 ? true : false,
              selectedColor: Colors.white,
              leading: selectedItem == 1
                  ? Image.asset(
                'image/leavesB.png',
                width: 45,
              )
                  : Image.asset(
                'image/leavesW.png',
                width: 45,
              ),
              title: Text(
                "Farm",
                style: TextStyle(
                    fontSize: 23,
                    color: selectedItem == 1 ? textColor : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  selectedItem = 1;
                });
                Navigator.pop(context);
                Navigator.pushReplacement((context),
                    MaterialPageRoute(builder: (context) => FarmPage()));
              },
            ),
            ListTile(
              selectedTileColor: selectedItem == 2 ? Colors.white : textColor,
              selected: selectedItem == 2 ? true : false,
              selectedColor: Colors.white,
              leading: selectedItem == 2
                  ? Image.asset(
                'image/bacteriaB.png',
                width: 45,
              )
                  : Image.asset(
                'image/bacteriaW.png',
                width: 45,
              ),
              title: Text(
                "Lab",
                style: TextStyle(
                    fontSize: 23,
                    color: selectedItem == 2 ? textColor : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  selectedItem = 2;
                });
                Navigator.pushReplacement((context),
                    MaterialPageRoute(builder: (context) =>LabPage()));
              },
            ),
            ListTile(
              selectedTileColor: selectedItem == 3 ? Colors.white : textColor,
              selected: selectedItem == 3 ? true : false,
              selectedColor: Colors.white,
              leading: selectedItem == 3
                  ? Icon(
                      Icons.person,
                      color: textColor,
                      size: 45,
                    )
                  : Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 45,
                    ),
              title: Text(
                "Account",
                style: TextStyle(
                    fontSize: 23,
                    color: selectedItem == 3 ? textColor : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  selectedItem = 3;
                });
                // Navigator.pushReplacement((context),
                //     MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              selectedTileColor: selectedItem == 4 ? Colors.white : textColor,
              selected: selectedItem == 4 ? true : false,
              selectedColor: Colors.white,
              leading: selectedItem == 4
                  ? Icon(
                      Icons.settings_outlined,
                      color: textColor,
                      size: 45,
                    )
                  : Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                      size: 45,
                    ),
              title: Text(
                "Setting",
                style: TextStyle(
                    fontSize: 23,
                    color: selectedItem == 4 ? textColor : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  selectedItem = 4;
                });
                // Navigator.pushReplacement((context),
                //   MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              selectedTileColor: selectedItem == 5 ? Colors.white : textColor,
              selected: selectedItem == 5 ? true : false,
              selectedColor: Colors.white,
              leading: selectedItem == 5
                  ? Icon(
                      Icons.help_outline,
                      color: textColor,
                      size: 45,
                    )
                  : Icon(
                      Icons.help_outline,
                      color: Colors.white,
                      size: 45,
                    ),
              title: Text(
                "Help",
                style: TextStyle(
                    fontSize: 23,
                    color: selectedItem == 5 ? textColor : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  selectedItem = 5;
                });
                // Navigator.pushReplacement((context),
                //   MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
          ])),
    );
  }
}
