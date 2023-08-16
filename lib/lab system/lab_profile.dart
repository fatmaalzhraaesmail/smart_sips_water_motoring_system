// ignore_for_file: prefer_final_fields, override_on_non_overriding_member

import 'dart:io';

import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:graduation_project/shared/component/component.dart';
import 'package:image_picker/image_picker.dart';
import '../shared/style/color.dart';
import 'lab_navigation.dart';

class ProfileLabScreen extends StatefulWidget {
  const ProfileLabScreen({super.key});

  @override
  State<ProfileLabScreen> createState() => _ProfileLabScreenState();
}

class _ProfileLabScreenState extends State<ProfileLabScreen> {
  late String username;
  late String email;
  late String country;
  late String phone_number;
  late String address;
  late String password;

  @override
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  //selected image
  ImagePicker _picker = ImagePicker();
  File? selectedimage;
  getimage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedimage = File(image.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: textColor,
        leading: IconButton(
          onPressed: () => Navigator.pushReplacement((context),
              MaterialPageRoute(builder: (context) => NavigationLabScreen())),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          'Account',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
        shadowColor: textColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.4,
              child: Stack(
                children: [
                  blueintrowidgetwithoutlogos(),

                  //camera in profile
                  Align(
                    alignment: Alignment.bottomLeft,
                    child:    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          child: ClipOval(
                              child: Image.asset(
                            'image/User.png',
                          )),
                          radius: 50,
                        ),
                      ))
                    // InkWell(
                    //     onTap: (() {
                    //       getimage(ImageSource.camera);
                    //     }),
                    //     child: selectedimage == null
                    //         ? Container(
                    //             width: 120,
                    //             height: 120,
                    //             margin: EdgeInsets.only(bottom: 20),
                    //             decoration: BoxDecoration(
                    //               shape: BoxShape.circle,
                    //               color: Color.fromRGBO(43, 70, 139, 1),
                    //             ),
                    //             child: Center(
                    //               child: Icon(
                    //                 Icons.camera_alt_outlined,
                    //                 size: 40,
                    //                 color: Colors.white,
                    //               ),
                    //             ),
                    //           )
                    //         : Container(
                    //             width: 120,
                    //             height: 120,
                    //             margin: EdgeInsets.only(bottom: 20),
                    //             decoration: BoxDecoration(
                    //               image: DecorationImage(
                    //                   image: FileImage(selectedimage!),
                    //                   fit: BoxFit.fill),
                    //               shape: BoxShape.circle,
                    //               color: Color.fromRGBO(43, 70, 139, 1),
                    //             ),
                    //           )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  defaultTextForm(
                    hint: 'Nada Monir',
                    prefix: Icon(
                      Icons.person,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultTextForm(
                    hint: 'nadamonir2@gmail.com',
                    prefix: Icon(
                      Icons.email,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultTextForm(
                    hint: 'Egypt',
                    prefix: Icon(
                      Icons.location_city,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultTextForm(
                    hint: 'Cairo',
                    prefix: Icon(
                      Icons.home,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultTextForm(
                    hint: '2010444882217',
                    prefix: Icon(
                      Icons.phone,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // defaultButton(color: textColor, text: 'UpData'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget blueintrowidgetwithoutlogos() {
    return Container(
      width: Get.width,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("image/smart sips logo.png"))),
        height: Get.height,
        width: Get.width,
        margin: EdgeInsets.only(bottom: Get.height * 0.05),
      ),
    );
  }

  TextFiledWidget(
    String title,
    IconData iconData,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: Get.width,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 2,
                )
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextField(
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    iconData,
                    color: iconColor,
                  ),
                ),
                border: InputBorder.none),
          ),
        )
      ],
    );
  }

  Widget button(String title, Function onpressed) {
    return MaterialButton(
      minWidth: 50,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: textColor,
      onPressed: () => onpressed(),
      child: Text(title,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}
