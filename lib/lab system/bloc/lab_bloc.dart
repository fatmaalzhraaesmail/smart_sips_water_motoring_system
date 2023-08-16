// ignore_for_file: dead_code

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../cubit/lab_state.dart';
import 'package:sqflite/sqflite.dart';

class DashboardCubLad extends Cubit<LabStates> {
  DashboardCubLad() : super(LabInitialState());
  static DashboardCubLad get(context) => BlocProvider.of(context);
  description(result2) {
    var description = '';
    if (result2 == "Escherichia.coli") {
      description = '''
Early symptoms of HUS include:
Diarrhea (usually bloody).
Fever.
Stomach pain.
Vomiting.
As disease progresses, symptoms include:

Decreased urination, blood in urine.
Feeling tired.
Pale-looking skin.
Easy bruising.
Fast heart rate.
Lightheadedness.
Sleepiness, confusion, seizures.
Kidney failure.''';
    } else if (result2 == 'Bacteroides.fragilis') {
      description =
          ''''Intra-abdominal infections: Bacteroides fragilis is a common cause of infections in the abdomen, such as peritonitis, abscesses, and diverticulitis.

Bacteremia and sepsis: In rare cases, Bacteroides fragilis can cause bloodstream infections (bacteremia) and sepsis.

Skin and soft tissue infections: Bacteroides fragilis can cause infections in the skin and soft tissues, such as cellulitis and wound infections.

Brain abscesses: Bacteroides fragilis is a rare cause of brain abscesses, which are collections of pus within the brain.

Respiratory infections: In rare cases, Bacteroides fragilis can cause pneumonia and other respiratory infections.
''';
    } else if (result2 == 'Candida.albicans') {
      description =
          '''Thrush: This is a fungal infection of the mouth and throat that can cause white patches on the tongue, inner cheeks, and throat, as well as soreness and difficulty swallowing.

Vaginal yeast infections: Candida albicans can cause infections of the vagina, resulting in itching, burning, and discharge.

Invasive candidiasis: This is a serious bloodstream infection that can occur in people with weakened immune systems, particularly those in intensive care units or undergoing cancer treatment.

Cutaneous candidiasis: This is a skin infection caused by Candida albicans that can result in red, itchy rashes with satellite lesions.

Systemic candidiasis: This is a rare but serious infection that can occur in people with compromised immune systems, such as those with HIV/AIDS or undergoing chemotherapy.
''';
    } else if (result2 == 'Staphylococcus.aureus') {
      description =
          '''Skin infections: Staphylococcus aureus is a common cause of skin infections, such as impetigo, cellulitis, and boils.

Food poisoning: Staphylococcus aureus can produce toxins that can cause symptoms such as nausea, vomiting, and diarrhea if contaminated food is consumed.

Bloodstream infections: Staphylococcus aureus can cause bloodstream infections (bacteremia), which can lead to sepsis, a potentially life-threatening condition.

Pneumonia: Staphylococcus aureus can cause pneumonia, particularly in individuals with underlying lung disease or weakened immune systems.

Bone and joint infections: Staphylococcus aureus can cause infections in the bones and joints, such as osteomyelitis and septic arthritis.

Toxic shock syndrome: Staphylococcus aureus can produce toxins that can cause toxic shock syndrome, a rare but serious condition that can result in fever, low blood pressure, and organ failure.
''';
    } else if (result2 == 'Acinetobacter.baumanii') {
      description =
          '''Pneumonia: Acinetobacter baumannii can cause a severe form of pneumonia, particularly in individuals who are on mechanical ventilation in an intensive care unit (ICU).

Bloodstream infections: Acinetobacter baumannii can cause bloodstream infections (bacteremia), which can lead to sepsis, a potentially life-threatening condition.

Urinary tract infections: Acinetobacter baumannii can cause urinary tract infections, particularly in individuals with urinary catheters.

Wound infections: Acinetobacter baumannii can cause infections in wounds, particularly in individuals who have been hospitalized or have had surgery.

Meningitis: Acinetobacter baumannii can cause meningitis, a serious infection of the brain and spinal cord.
''';
    } else {
      description = "Sorry,Cannot Recognize bacteria";
    }
    return description;
  }

  File? image;
  final picker = ImagePicker();
  String final_response = "";
  String res3 = "";
  Future openFilePicker() async {
    FilePickerResult? result;
    print("pick files");
    result = await FilePicker.platform
        .pickFiles(allowMultiple: true, withReadStream: true, withData: false);
    // ignore: no_leading_underscores_for_local_identifiers
    var _image = File(result!.files.single.path!);
    print('name : ${result.files.first.name}');
    //---Create http package multipart request object
    // ignore: await_only_futures
    var request = await http.MultipartRequest(
      "POST",
      Uri.parse(
        "http://10.0.2.2:5000/uploads",
      ),
    );

    List<PlatformFile>? files = result.files;

    print("adding files selected with file picker");
    for (PlatformFile file in files) {
      //-----add selected file with request
      request.files.add(http.MultipartFile(
          "Your parameter name on server side", file.readStream!, file.size,
          filename: file.name));
    }
    var resp = await request.send();

    print({resp});
    //------Read response
    String result2 = await resp.stream.bytesToString();

    //-------Your response
    File imageFile = File(_image.path);
    Uint8List bytes1 = imageFile.readAsBytesSync();
    final directory = await getApplicationSupportDirectory();
    print('directory: $directory');
    final bytess = await File(_image.path).readAsBytes();
    final imagename = result.files.first.name;
    final image_path_saved = result.files.first.path;
    final savedImagePath = '${directory.path}/$imagename';
    print('savedImagePath: $savedImagePath');
    var descriptionn = description(result2);

    var finalResult = [
      result2,
      imageFile,
      imagename,
      descriptionn,
      savedImagePath,
      bytes1,
      bytess,
      image_path_saved
    ];
    print('imageFile: $imageFile');
    print('finalResult: $finalResult');

    return finalResult;

    emit(LabAddedImageState());
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;
   // ignore: unused_local_variable
      final imageTemp = File(image.path);
      // setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  Future<void> AddLabBacteriaInfo(String image_path, String image_name,
      String species, String description) async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('bacteria_Data');
    await collectionRef.add({
      'image_path': image_path,
      'image_name': image_name,
      'species': species,
      'description': description,
    });
  }
  late Database database;
  List<Map> bacterias = [];
  void createDatabase() {
    openDatabase(
      'SavedBacteriaResults_final.db',
      version: 1,
      onCreate: (database, version) {
        print(
            'Database Created'); //only one time when created database for the first time

        database
            .execute(
                //image_name, species, description, image
                'CREATE TABLE bacteriaa(id INTEGER PRIMARY KEY, image_name TEXT, species TEXT, description TEXT, image TEXT)')
            .then((value) {
          print('Table Created');
        }).catchError((error) {
          print(error.toString());
        });
      },
      onOpen: (database) {
        getDateFromDateBase(database).then((value) {
          bacterias = value;
          print(bacterias);
          emit(AppGetDatabaseStates());
        });
        print('Database Opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseStates());
    });
  }

  insertToDatabase(
      {required String image_name,
      required String species,
      required String description,
      required String image}) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO bacteriaa(image_name, species, description, image) VALUES("$image_name", "$species", "$description", "$image")')
          .then((value) {
        print("$value inserted sucessfully");
        emit(AppInsertDatabaseStates());
        getDateFromDateBase(database).then((value) {
          bacterias = value;
          print('bacterias: $bacterias');
          emit(AppGetDatabaseStates());
        });
      }).catchError((error) {
        print("error when inserted new record $error.toString()");
      });
      // return null;
    });
  }

  Future<List<Map>> getDateFromDateBase(database) async {
    emit(AppGetDatabaseLoadingStates());
    return await database.rawQuery('SELECT * FROM bacteriaa');
  }

  void deletDate({required int id}) async {
    database
        .rawDelete('DELETE FROM bacteriaa WHERE id= ? ', [id]).then((value) {
      // getDateFromDateBase(database);
      emit(AppDeleteDatabaseStates());
      getDateFromDateBase(database).then((value) {
        bacterias = value;
        print(bacterias);
        emit(AppGetDatabaseStates());
      });
    });
  }

  void updateData({
    required String title,
    required String descrption,
    required int id,
  }) {
    database.rawUpdate(
      'UPDATE bacteriaa SET title = ?, descrption = ? WHERE id = ?',
      [
        title,
        descrption,
        id,
      ],
    ).then((value) {
      emit(AppUpdateDatabaseStates());
      getDateFromDateBase(database).then((value) {
        bacterias = value;
        print(bacterias);
        emit(AppGetDatabaseStates());
      });
    });
  }
}
