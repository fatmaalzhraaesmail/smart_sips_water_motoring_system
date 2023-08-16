
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import '../shared/style/color.dart';

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
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               MaterialButton(
//                                   child: Image.asset(
//                                     'image/browse.png',
//                                     width: 50,
//                                   ),
//                                   onPressed: () {
//                                     pickImage();
//                                   }),
//                               Text(
//                                 'Or',
//                                 style: TextStyle(
//                                     fontSize: 25,
//                                     fontWeight: FontWeight.w600,
//                                     color: textColor),
//                               ),
//                               MaterialButton(
//                                   child: Image.asset(
//                                     'image/camera.png',
//                                     width: 50,
//                                   ),
//                                   onPressed: () {
//                                     pickImageC();
//                                   }),
//                             ],
//                           ),
//                         ]),
//                       ),
//                     ),
//                   ]),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Expanded(
//                   child: Container(
//                       decoration: BoxDecoration(
//                           color: background,
//                           borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(70),
//                               topRight: Radius.circular(70))),
//                       child: TabBar(
//                           indicatorWeight: 5,
//                           indicatorColor: textColor,
//                           tabs: [
//                             Tab(
//                               child: Text(
//                                 'Updating',
//                                 style: TextStyle(
//                                     color: textColor,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Tab(
//                               child: Text(
//                                 'Saved',
//                                 style: TextStyle(
//                                     color: textColor,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             Tab(
//                               child: Text(
//                                 'Delete',
//                                 style: TextStyle(
//                                     color: textColor,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ])),
//                 ),
//                 Expanded(
//                   child: TabBarView(children: [
//                     UpLoading(),
//                     Saved(),
//                     Delete(),
//                   ]),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }

//   UpLoading() {
//     return Container(
//         child: image != null ? Image.file(image!) : Text("No image selected"));
//   }

//   Saved() {
//     return Text('saved');
//   }

//   Delete() {
//     return Text('Delete');
//   }
// }

/////=====================
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

// ignore_for_file: unused_local_variable, prefer_is_empty, avoid_unnecessary_containers, avoid_types_as_parameter_names, duplicate_ignore, prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/lab%20system/cubit/lab_state.dart';
import 'package:graduation_project/shared/style/color.dart';
import 'bloc/lab_bloc.dart';

class LabScreen extends StatefulWidget {
  const LabScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LabScreen> createState() => _LabScreenState();
}

class _LabScreenState extends State<LabScreen> {
  var BacteriaSaved;
  // ignore: prefer_typing_uninitialized_variables
  var image1;
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
      // _imageFile = await File(result.files.single.path);
      _imageWidget = Image.file(_imageFile!);
      return _imageFile;
      // setState(() => this.result = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  imageConvert(imgData) {
    final List<int> imgBytes = imgData
        .replaceAll('[', '')
        .replaceAll(']', '')
        .split(',')
        .map((e) => int.parse(e.trim()))
        .toList();
    final bytes = Uint8List.fromList(imgBytes);
    print(bytes);
    return bytes;
  }

  Future imageFromdatabase(filePath) async {
    File imageFile = File(filePath);
    Uint8List bytes = await imageFile.readAsBytes();
    return bytes;
  }
  // Future pickImageC() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.camera);

  //     if (image == null) return;

  //     final imageTemp = File(image.path);

  //     setState(() => this.image = imageTemp);
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<DashboardCubLad>();
    var bloc1 = context.read<DashboardCubLad>()..createDatabase();
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
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     MaterialButton(
                          //         child: Image.asset(
                          //           'image/browse.png',
                          //           width: 50,
                          //         ),
                          //         onPressed: () {
                          //           pickImage();
                          //         }),
                          //     Text(
                          //       'Or',
                          //       style: TextStyle(
                          //           fontSize: 25,
                          //           fontWeight: FontWeight.w600,
                          //           color: textColor),
                          //     ),
                          //     MaterialButton(
                          //         child: Image.asset(
                          //           'image/camera.png',
                          //           width: 50,
                          //         ),
                          //         onPressed: () {
                          //           pickImageC();
                          //         }),
                          //   ],
                          // ),

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
                                          BacteriaSaved = image1;
                                        });
                                        // var image1 =await pickImage();
                                        // print(image1);

                                        // var rrr =await bloc.openFilePicker(image1);
                                        // print(rrr);
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
    var bloc = context.read<DashboardCubLad>();
    var bloc1 = context.read<DashboardCubLad>()..createDatabase();

    return Container(
        color: background,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: BacteriaSaved == null
                    ? Center(
                        child: Container(
                            child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("No Uploaded Image Yet"),
                        )),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: BacteriaSaved == null
                                  ? Text('No Image')
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.file(
                                        BacteriaSaved[1],
                                        fit: BoxFit.cover,
                                        width: 85,
                                        height: 85,
                                      ),
                                    ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BacteriaSaved == null
                                      ? Text('No Image uploaded')
                                      : Text(
                                          '${BacteriaSaved[2]}',
                                          style: TextStyle(
                                              color: textColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Type of bacteria",
                                    style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  BacteriaSaved == null
                                      ? Text('data')
                                      : Text(
                                          '${BacteriaSaved[0]}',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    "Realted Diseases",
                                    style: TextStyle(
                                        color: textColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    width: 210,
                                    child: Text(
                                      BacteriaSaved[3],
                                      style: TextStyle(),
                                      textAlign: TextAlign.justify,
                                      textDirection: TextDirection.ltr,
                                      maxLines: 6,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.orange,
                                    ),
                                    InkWell(
                                      child: Icon(
                                        Icons.save_alt,
                                        color: Colors.orange,
                                      ),
                                      //      var finalResult = [result2, imageFile, imagename, description];

                                      onTap: () {
                                        bloc1.insertToDatabase(
                                            image_name: BacteriaSaved[2],
                                            species: BacteriaSaved[0],
                                            description: BacteriaSaved[3],
                                            image: BacteriaSaved[7]);

                                        print('${bloc.bacterias}');
                                      },
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ));
  }

  Saved() {
    // ignore: prefer_typing_uninitialized_variables
    final bytes;
    // var BacteriaSaved;
    // print('bacteria : ${BacteriaSaved.length}');
    return BlocBuilder<DashboardCubLad, LabStates>(
      builder: (context, LabStates) {
        var bloc = context.read<DashboardCubLad>();
      var  BacteriaSaved = bloc.bacterias;
        return Container(
          color: background,
          child: BacteriaSaved.length > 0
              ? Container(
                  child: ListView.separated(
                      itemBuilder: (context, index) => Container(
                          color: background,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    // ignore: unnecessary_null_comparison
                                    child: BacteriaSaved == null
                                        ? Center(
                                            // ignore: avoid_unnecessary_containers
                                            child: Container(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child:
                                                  Text("No Uploaded Image Yet"),
                                            )),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  // ignore: unnecessary_null_comparison
                                                  child: BacteriaSaved == null
                                                      ? Text('No Image')
                                                      : ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          child: Image.file(
                                                            File(BacteriaSaved[
                                                                    index]
                                                                ['image']),
                                                            fit: BoxFit.cover,
                                                            width: 85,
                                                            height: 85,
                                                          ),
                                                        ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // ignore: unnecessary_null_comparison
                                                      BacteriaSaved == null
                                                          ? Text(
                                                              'No Image uploaded')
                                                          : Text(
                                                              '${BacteriaSaved[index]['image_name']}',
                                                              style: TextStyle(
                                                                  color:
                                                                      textColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Type of bacteria",
                                                        style: TextStyle(
                                                            color: textColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      // ignore: unnecessary_null_comparison
                                                      BacteriaSaved == null
                                                          ? Text('data')
                                                          : Text(
                                                              '${BacteriaSaved[index]['species']}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                      SizedBox(
                                                        height: 6,
                                                      ),
                                                      Text(
                                                        "Realted Diseases",
                                                        style: TextStyle(
                                                            color: textColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      Container(
                                                        width: 210,
                                                        child: Text(
                                                          BacteriaSaved[index]
                                                              ['description'],
                                                          style: TextStyle(),
                                                          textAlign:
                                                              TextAlign.justify,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          maxLines: 6,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          softWrap: false,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            bloc.deletDate(
                                                                id: BacteriaSaved[
                                                                        index]
                                                                    ['id']);
                                                          },
                                                          child: Icon(
                                                            Icons.delete,
                                                            color:
                                                                Colors.orange,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          )),

                      ///
                      separatorBuilder: (context, index) => Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 20.0),
                            child: Container(
                              width: double.infinity,
                              height: 1.0,
                              color: Colors.grey[300],
                            ),
                          ),
                      itemCount: BacteriaSaved.length),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.menu,
                        size: 100.0,
                        color: Colors.grey,
                      ),
                      Text('No BacteriaSaved Yet',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          )),
                    ],
                  ),
                ),
        );
      },
    );
  }

  Delete() {
    return Text('Delete');
  }
}
