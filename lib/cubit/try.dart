// import 'package:bloc/bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:graduation_project/cubit/try_state.dart';


// class ProfileCubit extends Cubit<ProfileState> {
//   ProfileCubit() : super(InitialUserState());
//   // ignore: body_might_complete_normally_nullable
//   Future<String?> Profile(BuildContext context,
//       {String? email,
//       String? username,
//       String? password,
//       String? phone_number,
//       String? address,
//       String? country}) async {
//     final user = await updateUserProfile(
//       email!,
//       password!,
//       phone_number!,
//       username!,
//       country!,
//       address!,
//     );
//     emit(InitialUserState());
//     try {
//       return user;
//     } catch (e) {
//       print(e);
//     }
//   }
// }
