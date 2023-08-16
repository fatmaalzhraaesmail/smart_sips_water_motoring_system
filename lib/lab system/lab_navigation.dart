import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/style/color.dart';
import 'cubit/lab_cubit.dart';
import 'cubit/lab_state.dart';


class NavigationLabScreen extends StatefulWidget {
  @override
  _NavigationLabScreenState createState() => _NavigationLabScreenState();
}

class _NavigationLabScreenState extends State<NavigationLabScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LabCubit(),
      child: BlocConsumer<LabCubit, LabStates>(
          listener: (BuildContext context, LabStates state) {},
          builder: (BuildContext context, LabStates state) {
            LabCubit cubit = LabCubit.get(context);
            return Scaffold(
              body: cubit.screens[cubit.currentIndex],
             
              bottomNavigationBar: CurvedNavigationBar(
                height: 50,
                items: const <Widget>[
                  Icon(CupertinoIcons.home, size: 30, color: Colors.white),
                  Icon(CupertinoIcons.bell, size: 30, color: Colors.white),
                  Icon(CupertinoIcons.chat_bubble_fill,
                      size: 30, color: Colors.white),
                  Icon(CupertinoIcons.person, size: 30, color: Colors.white),
                ],
                color: textColor,
                buttonBackgroundColor: textColor,
                backgroundColor: background,
                animationCurve: Curves.easeIn,
                animationDuration: const Duration(milliseconds: 400),
                onTap: (index) {
                  cubit.changeIndex(index);
                },
              ),
            );
          }),
    );
  }
}
