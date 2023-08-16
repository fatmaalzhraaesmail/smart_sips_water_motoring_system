// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/cubit/state.dart';
// import 'package:graduation_project/modules/Laboratory/bloc/lab_bloc.dart';
// import 'package:graduation_project/modules/Laboratory/pages/delete.dart';
// import 'package:graduation_project/modules/Laboratory/pages/saved.dart';
// import 'package:graduation_project/modules/Laboratory/pages/uploading.dart';

// import 'package:image_picker/image_picker.dart';
// import '../../../../shared/component/component.dart';
// import '../../../../shared/style/color.dart';

// class LabScreen extends StatefulWidget {
//   const LabScreen({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<LabScreen> createState() => _LabScreenState();
// }

// class _LabScreenState extends State<LabScreen> {
//   File? image;

//   Future pickImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);

//       if (image == null) return;

//       final imageTemp = File(image.path);

//       setState(() => this.image = imageTemp);
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

//   Future pickImageC() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.camera);

//       if (image == null) return;

//       final imageTemp = File(image.path);

//       setState(() => this.image = imageTemp);
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var bloc = context.read<DashboardCubLad>();

//     return DefaultTabController(
//       initialIndex: 1,
//       length: 3,
//       child: Scaffold(
//           appBar: AppBar(
//             elevation: 0,
//             centerTitle: true,
//             title: Text(
//               'Lab',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold),
//             ),
//             backgroundColor: textColor,
//             actions: [Image.asset('image/logo in bar.png')],
//           ),
//           body: Center(
//             child: Column(
//               children: [
//                 Center(
//                   child: Stack(children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 10),
//                       child: Container(
//                         width: 300,
//                         height: 300,
//                         decoration: BoxDecoration(
//                             color: background,
//                             borderRadius: BorderRadius.circular(40)),
//                         child: Column(children: [
//                           Image.asset(
//                             'image/upload img.png',
//                             height: 150,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text(
//                             'Drop your image here',
//                             style: TextStyle(
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.w600,
//                                 color: textColor),
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           BlocBuilder<DashboardCubLad, AppStates>(
//                             builder: (context, state) {
//                               return Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   MaterialButton(
//                                       child: Image.asset(
//                                         'image/browse.png',
//                                         width: 50,
//                                       ),
//                                       onPressed: () {
//                                         bloc.openFilePicker();
//                                         // pickImage();
//                                       }),
//                                   Text(
//                                     'Or',
//                                     style: TextStyle(
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.w600,
//                                         color: textColor),
//                                   ),
//                                   MaterialButton(
//                                       child: Image.asset(
//                                         'image/camera.png',
//                                         width: 50,
//                                       ),
//                                       onPressed: () {
//                                         pickImageC();
//                                       }),
//                                 ],
//                               );
//                             },
//                           ),
//                           //   Row(
//                           //     mainAxisAlignment: MainAxisAlignment.center,
//                           //     children: [
//                           //       MaterialButton(
//                           //           child: Image.asset(
//                           //             'image/browse.png',
//                           //             width: 50,
//                           //           ),
//                           //           onPressed: () {
//                           //             pickImage();
//                           //           }),
//                           //       Text(
//                           //         'Or',
//                           //         style: TextStyle(
//                           //             fontSize: 25,
//                           //             fontWeight: FontWeight.w600,
//                           //             color: textColor),
//                           //       ),
//                           //       MaterialButton(
//                           //           child: Image.asset(
//                           //             'image/camera.png',
//                           //             width: 50,
//                           //           ),
//                           //           onPressed: () {
//                           //             pickImageC();
//                           //           }),
//                           //     ],
//                           //   ),
//                         ]),
//                       ),
//                     ),
//                   ]),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 // Expanded(
//                 //     child: image != null
//                 //         ? Image.file(image!)
//                 //         : Text("No image selected")),
//                 defaultContainer(
//                     widget: TabBar(tabs: [
//                   Tab(
//                     text: "UpLoading",
//                   ),
//                   Tab(
//                     text: "Saved",
//                   ),
//                   Tab(
//                     text: "Delete",
//                   ),
//                 ])),
//                 Expanded(
//                   child: TabBarView(children: [
//                     UpLoading(),
//                     Saved(),
//                     Delete(),
//                   ]),
//                 )
//               ],
//             ),
//           )),
//     );
//   }
// }

// ignore_for_file: unused_local_variable, avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/lab%20system/cubit/lab_state.dart';
import 'package:graduation_project/shared/style/color.dart';

import '../bloc/lab_bloc.dart';

class LabScreen extends StatefulWidget {
  const LabScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LabScreen> createState() => _LabScreenState();
}

class _LabScreenState extends State<LabScreen> {
  // File? _imageFile;
  // Image? _imageWidget;
  // // FilePickerResult? result;
  // Future<void> _pickImage() async {
  //   FilePickerResult? result =
  //       await FilePicker.platform.pickFiles(type: FileType.image);
  //   if (result != null) {
  //     setState(() async {
  //       _imageFile = await File(result.files.single.path).toString();
  //       _imageWidget = Image.file(_imageFile!);
  //     });
 
  var image2;
  var image1;
  File? image;
  FilePickerResult? result;
  File? _imageFile;
  // ignore: unused_field
  Image? _imageWidget;
  Future pickImage() async {
    try {
      print("pick files");
      result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result != null && result!.files.isNotEmpty) {
        _imageFile = File(result!.files.single.path!);
      }
      _imageWidget = Image.file(_imageFile!);
      return _imageFile;
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<DashboardCubLad>();
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Lab',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: textColor,
            actions: [Image.asset('image/logo in bar.png')],
          ),
          body: Center(
            child: Column(
              children: [
                Center(
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                            color: background,
                            borderRadius: BorderRadius.circular(40)),
                        child: Column(children: [
                          Image.asset(
                            'image/upload img.png',
                            height: 150,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Drop your image here',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: textColor),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          BlocBuilder<DashboardCubLad, LabStates>(
                            builder: (context, state) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                      child: Image.asset(
                                        'image/browse.png',
                                        width: 50,
                                      ),
                                      onPressed: () async {
                                        image1 = await bloc.openFilePicker();
                                        print('iiiii ${image1[0]}');
                                        print('iiiii ${image1[1]}');
                                        setState(() {
                                          image2 = image1;
                                        });
                                      }),
                                  Text(
                                    'Or',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: textColor),
                                  ),
                                  MaterialButton(
                                      child: Image.asset(
                                        'image/camera.png',
                                        width: 50,
                                      ),
                                      onPressed: () {
                                        // pickImageC();
                                      }),
                                ],
                              );
                            },
                          ),
                        ]),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          color: background,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(70),
                              topRight: Radius.circular(70))),
                      child: TabBar(
                          indicatorWeight: 5,
                          indicatorColor: textColor,
                          tabs: [
                            Tab(
                              child: Text(
                                'Updating',
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Saved',
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                    color: textColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ])),
                ),
                Expanded(
                  child: TabBarView(children: [
                    UpLoading(),
                    Saved(),
                    Delete(),
                  ]),
                ),
              ],
            ),
          )),
    );
  }

  UpLoading() {
    return Container(
        child: Column(
      children: [
        // Text('${image2![0]}'),
        // Image.file(image2[1]),
        image2 == null
            ? Text('data')
            : Text(
                '${image2[0]}',
                style: TextStyle(color: Colors.amber),
              ),

        // image2 == null ? Text('No Image') :Image.file(image2[1]),
      ],
    ));
  }

  Saved() {
    return Text('saved');
  }

  Delete() {
    return Text('Delete');
  }
}
