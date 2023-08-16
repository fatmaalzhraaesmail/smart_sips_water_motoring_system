// ignore_for_file: unused_local_variable, unused_element

import 'dart:convert';
import 'package:graduation_project/models/profile.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:graduation_project/models/user.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import '../shared/component/constant.dart';
import '../shared/network/local/cashe_helper.dart';

var general_token = "";

Future<dynamic> userAuth(String email, String password) async {
  Map<String, dynamic> body = {
    "email": email,
    "password": password,
  };
  var url = Uri.parse(
      'https://smartsips-production.up.railway.app/user_api/auth/login/');
  var res = await http.post(url, body: body);
  if (res.statusCode == 200 || res.statusCode == 201) {
    Map json = jsonDecode(res.body);
    String token = json["access_token"];
    SharedHelper.save(value: token, key: 'token');
    print(SharedHelper.get(key: 'pk'));
    var box = await Hive.openBox(tokenBox);
    box.put("token", token);
    User? user = await getUser(token);
    return json;
  } else {
    Map json = jsonDecode(res.body);
    if (json.containsKey("email")) {
      return json["email"][0];
    }
    if (json.containsKey("password")) {
      return json["password"][0];
    }
    if (json.containsKey("username")) {
      return json["username"][0];
    }
    if (json.containsKey("non_field_errors")) {
      return json["non_field_errors"][0];
    }
  }
}

var token11 = "";
// ignore: body_might_complete_normally_nullable
Future<User?> getUser(String token) async {
  var url = Uri.parse(
      "https://smartsips-production.up.railway.app/user_api/{id}/userprofile/update");
  var res = await http.get(url, headers: {"Authorization": "Token $token"});
  print(res.statusCode);
  if (res.statusCode == 200) {
    var json = await jsonDecode(res.body);
    User user = User.fromJson(json);
    user.token = token;
    token11 = user.token;
    SharedHelper.save(value: user.pk, key: 'pk');
    print(SharedHelper.get(key: 'pk'));
    SharedHelper.save(value: user.token.toString(), key: 'token');
    SharedHelper.save(value: true, key: 'signIn');

    return json;
  } 
}

User getUserProfile() {
  print('general_token: $general_token');
  User user = User.fromJson(getUser(SharedHelper.get(key: 'pk')));
  print(user);
  return user;
}

Future<dynamic> registerUser(int pk, String email, String username,
    String password1, String password2) async {
  Map<String, dynamic> data = {
    'pk': pk,
    'username': username,
    'email': email,
    'password1': password1,
    'password2': password2,
  };
  var url = Uri.parse(
      "https://smartsips-production.up.railway.app/user_api/auth/registration/");
  var res = await http.post(url,
      headers: {
        "content-type": "application/json",
      },
      body: jsonEncode(data));
  print(res.statusCode);
  print(res.body);
  if (res.statusCode == 200 || res.statusCode == 201) {
    Map json = await jsonDecode(res.body);
    String token = await json["access_token"];
    int pkk = await json["user"]['pk'];
    SharedHelper.save(value: pkk.toString(), key: 'pkk');
    SharedHelper.save(value: token.toString(), key: 'access_token');
    var box = await Hive.openBox(tokenBox);
    box.put("token", token);
    if (json.containsKey('access_token')) {
      var a = await getUser(token);
      if (a != null) {
        User user = a;
        print('///////////////');
        print(SharedHelper.get(key: 'pk'));
        SharedHelper.save(value: user.token.toString(), key: 'token');
        SharedHelper.save(value: true, key: 'signIn');
        SharedHelper.save(value: user.pk.toString(), key: 'pk');
        print(SharedHelper.get(key: 'pk'));
        print(json);
        return json;
      }
      User? user = await getUser(token);
      return json;
    } else if (res.statusCode == 400) {
      Map json = jsonDecode(res.body);
      if (json.containsKey('email')) {
        return json['email'][0];
      } else if (json.containsKey('password1')) {
        return json['password1'][0];
      }
    } else {
      print(res.statusCode);
      print(res.body);
    }
  }

  Future<void> logOut(String token) async {
    var url = Uri.parse(
        "https://smartsips-production.up.railway.app/user_api/auth/logout/");
    var res = await http.post(url, headers: {"Authorization": "Token $token"});
  }

  Future<void> sendEmailVerification(
    String idToken,
  ) async {
    final url = Uri.parse(
        'https://smartsips-production.up.railway.app/user_api/auth/registration/verify-email/');
    final body = {
      'token': idToken,
      'detail': 'VERIFY_EMAIL',
    };

    final response = await http.post(url, body: body);

    if (response.statusCode != 200) {
      final error = response.body;
      throw Exception(error);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    final url = Uri.parse(
        'https://smartsips-production.up.railway.app/user_api/auth/password/reset/');
    final body = {
      'email': email,
      'detail': 'PASSWORD_RESET',
    };

    final response = await http.post(url, body: body);

    if (response.statusCode != 200) {
      final error = response.body;
      throw Exception(error);
    }
  }

  Future<String?> updateUserProfile(String username, String phone_number,
      String address, String password, String email, String country) async {
    final url = Uri.parse(
        'https://smartsips-production.up.railway.app/user_api/{id}/userprofile/get');
    final body = {
      "phone_number": phone_number,
      "address": address,
      "username": username,
      "password": password,
      "email": email,
      "country": country
    };

    final response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      var json = await jsonDecode(response.body);
      String token = json["access_token"];
      var box = await Hive.openBox(tokenBox);
      box.put("token", token);
      Profile? user = (await getUser(token)) as Profile?;
      return json;
    } else {
      return null;
    }
  }
}

Future<void> logOut(String token) async {
  var url = Uri.parse(
      "https://smartsips-production.up.railway.app/user_api/auth/logout/");
  var res = await http.post(url, headers: {"Authorization": "Token $token"});
}

class UserProfile {
  String username;
  String email;
  String country;
  String address;
  String phone_number;

  UserProfile({
    required this.username,
    required this.email,
    required this.phone_number,
    required this.address,
    required this.country,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'phoneNumber': phone_number,
        'address': address,
        'country': country,
      };
  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      username: json['username'],
      email: json['email'],
      phone_number: json['phone_number'],
      address: json['address'],
      country: json['country'],
    );
  }
}

void updateUserProfile(UserProfile userProfile, BuildContext context) async {
  var user_id = SharedHelper.get(key: 'pkk');
  var token = SharedHelper.get(key: 'access_token');
  final apiUrl =
      "https://smartsips-production.up.railway.app/user_api/$user_id/userprofile/update";
  final headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token"
    // "Authorization": "Token $token"
  };

  final jsonBody = json.encode(userProfile.toJson());
  final response =
      await http.put(Uri.parse(apiUrl), headers: headers, body: jsonBody);
  print(response.body);

  if (response.statusCode == 200) {
    print("Profile updated successfully");
  } else {
    print("Failed to update profile: ${response.body}");
  }
}
