import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/farmer%20system/navigations_farm.dart';
import 'package:graduation_project/lab%20system/lab_navigation.dart';
import 'package:graduation_project/normal%20system/cubit/cubit.dart';
import 'package:graduation_project/normal%20system/cubit/state.dart';
import 'package:graduation_project/normal%20system/navigation.dart';
import 'package:graduation_project/normal%20system/profile.dart';
import 'package:graduation_project/shared/component/component.dart';
import 'package:graduation_project/shared/style/color.dart';
import 'package:graduation_project/utils/ar.dart';
import 'package:graduation_project/utils/en.dart';

import '../login/welcome.dart';
import '../shared/network/local/cashe_helper.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedItem = 0;
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
                    create: (BuildContext context) => AppCubit(),
                    child: BlocConsumer<AppCubit, AppStates>(
                        listener: (BuildContext context, AppStates state) {},
                        builder: (BuildContext context, AppStates state) {
                          AppCubit cubit = AppCubit.get(context);
                          return Container(
                              height: 290,
                              padding: EdgeInsets.all(12.0),
                              child: GridView.builder(
                                // itemCount: images.length,
                                itemCount: cubit.images.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 3 / 2,
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 18.0,
                                        mainAxisSpacing: 18.0),
                                itemBuilder: (BuildContext context, int index) {
                                  return DashBoardCard(
                                      cubit.images[index], cubit.titles[index],
                                      () {
                                    Navigator.pushReplacement(
                                        (context),
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                cubit.Dashboard_Home[index]));
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
                    MaterialPageRoute(builder: (context) => NavigationScreen()));
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
                    MaterialPageRoute(builder: (context) => NavigationFarmScreen()));
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
                Navigator.pop(context);

                Navigator.pushReplacement((context),
                    MaterialPageRoute(builder: (context) => NavigationLabScreen()));
              },
            ),
              ListTile(
                  selectedTileColor:
                      selectedItem == 3 ? Colors.white : textColor,
                  selected: selectedItem == 3 ? true : false,
                  selectedColor: Colors.white,
                  leading: selectedItem == 3
                      ? Icon(
                          Icons.feedback,
                          color: textColor,
                          size: 45,
                        )
                      : Icon(
                          Icons.feedback,
                          color: Colors.white,
                          size: 45,
                        ),
                  title: Text(
                    "Feedback",
                    style: TextStyle(
                        fontSize: 23,
                        color: selectedItem == 3 ? textColor : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    setState(
                      () {
                        selectedItem = 3;
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(70)),
                                insetAnimationCurve: Curves.bounceIn,
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 500,
                                    width: 400,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20, horizontal: 8),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Give Feedback",
                                                style: TextStyle(
                                                    color: textColor,
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.start,
                                              ),
                                              SizedBox(
                                                width: 80,
                                              ),
                                              IconButton(
                                                icon: Image.asset(
                                                  'image/x.png',
                                                  width: 15,
                                                  height: 15,
                                                  color: textColor,
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          'What do you think of tools?',
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 37),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'image/happy (1).png',
                                                width: 50,
                                                height: 40,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Image.asset(
                                                'image/smile.png',
                                                width: 50,
                                                height: 40,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Image.asset('image/sad-face.png',
                                                  width: 50, height: 40),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Image.asset(
                                                  'image/neutral-face.png',
                                                  width: 50,
                                                  height: 40),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Text(
                                          'Do you have any notes?',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 20,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        // SizedBox(height: 40,),
                                        TextFormField(
                                            maxLines: 7,
                                            minLines: 1,
                                            maxLength: 10,
                                            style: TextStyle(color: iconColor),
                                            keyboardType:
                                                TextInputType.multiline,
                                            enabled: true,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  borderSide: BorderSide(
                                                      width: 3,
                                                      color: Colors.grey)),
                                              fillColor: Colors.white,
                                              filled: true,
                                              hoverColor: background,
                                              hintText: 'notes....',
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              contentPadding: EdgeInsets.only(
                                                  top: 0, left: 25),
                                            )),
                                        SizedBox(
                                          height: 70,
                                        ),
                                        MaterialButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            color: textColor,
                                            child: Text(
                                              'Send',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ))
                                      ],
                                    )),
                              );
                            }));
                      },
                    );
                  }),
            ListTile(
              selectedTileColor: selectedItem == 4 ? Colors.white : textColor,
              selected: selectedItem == 4 ? true : false,
              selectedColor: Colors.white,
              leading: selectedItem == 4
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
                    color: selectedItem == 4 ? textColor : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  selectedItem = 4;
                });
                 Navigator.pushReplacement((context),
                   MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              selectedTileColor: selectedItem == 5 ? Colors.white : textColor,
              selected: selectedItem == 5 ? true : false,
              selectedColor: Colors.white,
              leading: selectedItem == 5
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
                    color: selectedItem == 5 ? textColor : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  selectedItem = 5;
                });
              },
            ),
            ListTile(
              selectedTileColor: selectedItem == 6 ? Colors.white : textColor,
              selected: selectedItem == 6 ? true : false,
              selectedColor: Colors.white,
              leading: selectedItem == 6
                  ? Icon(
                      Icons.logout_outlined,
                      color: textColor,
                      size: 45,
                    )
                  : Icon(
                      Icons.logout_outlined,
                      color: Colors.white,
                      size: 45,
                    ),
              title: Text(
                "LogOut",
                style: TextStyle(
                    fontSize: 23,
                    color: selectedItem == 6 ? textColor : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                setState(() {
                  selectedItem = 6;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WelcomeScreen()));
                });
              },
            ),
          ])),
    
    );
  }
}
