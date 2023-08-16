import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/style/color.dart';
import 'cubit/farm_cubit.dart';
import 'cubit/farm_state.dart';

class NavigationFarmScreen extends StatefulWidget {
  @override
  _NavigationFarmScreenState createState() => _NavigationFarmScreenState();
}

class _NavigationFarmScreenState extends State<NavigationFarmScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FarmCubit(),
      child: BlocConsumer<FarmCubit, FarmStates>(
          listener: (BuildContext context, FarmStates state) {},
          builder: (BuildContext context, FarmStates state) {
            FarmCubit cubit = FarmCubit.get(context);
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
