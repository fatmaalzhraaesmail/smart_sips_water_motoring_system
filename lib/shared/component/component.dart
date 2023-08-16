// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/shared/style/color.dart';


//for container in login & signup
Widget defaultContainer({required Widget widget}) => Flexible(
        child: Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      ),
      child: widget,
    ));

// for TextForm to input
Widget defaultTextForm({
  OnTap? onTap,
  double width = 293,
  required String hint,
  Icon? prefix,
  bool obscure = true,
  Widget? suffix,
  var controller,
}) =>
    Container(
      height: 46,
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: iconColor),
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          fillColor: Colors.white,
          filled: true,
          hoverColor: background,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.only(top: 0, left: 25),
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        onFieldSubmitted: (value) {
          print(value);
        },
        onChanged: (value) {
          print(value);
        },
        obscureText: obscure,
      ),
    );

//for Button in sign in
Widget defaultButton({
  double width = 249,
  double height = 46,
  Color sign = Colors.white,
  required Color color,
  required String text,
  bool isUpperCase = true,
  VoidCallback ? onTap,
}) =>
    Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: Text(
         text,
          style: TextStyle(color: sign, fontSize: 20.0),
        ),
      ),
    );

// for social container
Widget socail(String img) => Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Image(image: AssetImage(img)),
    );
// Widget NavLogo(String img) => Container(
//       width: 50,

//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(20)),
//       child: Image(image: AssetImage(img)),
//     );

// Widget NavLogo(String img) => CircleAvatar(
//   radius: 30,
//   foregroundImage: AssetImage(img),

//   // child: Container(child: Image(image: AssetImage(img))),
// );
Widget NavLogo(String img) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
      child: CircleAvatar(
          radius: (32),
          backgroundColor: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(img),
          )),
    );

Widget DashBoardCard(String img, String title, Function ontap) => InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(13)),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(width: 60, height: 60, child: Image.asset(img)),
            SizedBox(
              height: 5,
            ),
            Text(
             'Devices',
              style: TextStyle(
                  color: textColor, fontSize: 17, fontWeight: FontWeight.w600),
            )
          ]),
        ),
      ),
    );
Widget drawerItem(String text, Function ontap, Color textColor,
    IconData iconleading, Color iconcolor, Color tilecolor,
    {TextAlign textaligned = TextAlign.start,
    IconData? icontrailing = Icons.arrow_forward_ios,}) {
  return Padding(
    padding: const EdgeInsets.only(top: 5),
    child: ListTile(
      iconColor: iconcolor,
      tileColor: tilecolor,
      title: Text(text,
        //  SharedHelper.get(key: 'theme') == 'Light Theme'
        //     ? (SharedHelper.get(key: 'lang') == 'en' ? en[text]! : ar[text]!)
        //   : (SharedHelper.get(key: 'lang') == 'en' ? en[text]! : ar[text]!),
         textAlign: textaligned,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
      ),
      leading: Icon(
        iconleading,
        size: 30,
      ),
      trailing: Icon(
        icontrailing,
        // size: 30,
      ),
      onTap: () {
        ontap();
      },
    ),
  );
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
              CircleAvatar(
                backgroundColor: color,
              )
            ],
          ),
        ),
      ),
    );

// Widget elementContainer(
//         {required String element,
//         required String description,
//         String? description2,
//         required double percent,
//         required String textPercent,
//         required Color color}) =>
//     Container(
//       width: 340,
//       height: 70,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               blurRadius: 4.0,
//               color: Colors.grey,
//             )
//           ]),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Text(
//                   element,
//                   style: TextStyle(
//                       color: textColor,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24),
//                 ),
//                 Text(
//                   description,
//                   style: TextStyle(color: textColor, fontSize: 17),
//                   maxLines: 2,
//                   overflow: TextOverflow.clip,
//                 ),
//                 Text(
//                   description2!,
//                   style: TextStyle(color: textColor, fontSize: 17),
//                 )
//               ]),
//               CircularPercentIndicator(
//                   radius: 30.0,
//                   lineWidth: 15.0,
//                   percent: percent,
//                   animation: true,
//                   animationDuration: 1500,
//                   center: Text(textPercent),
//                   progressColor: color)
//             ],
//           ),
//         ),
//       ),
//     );





