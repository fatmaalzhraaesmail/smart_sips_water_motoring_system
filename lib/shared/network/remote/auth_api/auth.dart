import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class AuthServices {
  final registerationUrl = Uri.parse(
      'https://smartsips-production.up.railway.app/user_api/auth/registration/');
  final loginUrl = Uri.parse(
      'https://smartsips-production.up.railway.app/user_api/auth/login/');
  final logOutUrl = Uri.parse(
      'https://smartsips-production.up.railway.app/user_api/auth/logout/');
  // ==> For registeration (Start)
  Future<RegistrationResponse?> registration(
      String username, String email, String password1, String password2) async {
    var response = await http.post(registerationUrl, body: {
      "username": username,
      "email": email,
      "password1": password1,
      "password2": password2,
    });
    // if (response.statusCode == 200) {
    //   Map json = jsonDecode(response.body);
    //   String token = json["access_token"];
    //   var box = await Hive.openBox(tokenBox);
    //   box.put("token", token);
    //   await getUser(token);
    // }
    print(response.body);
    return RegistrationResponse.fromJson(jsonDecode(response.body));
  }
  // ==> (End)

  // ==> For Login (start)
  Future<LoginResponse?> LogIn(
      String username, String email, String password) async {
    var response = await http.post(loginUrl, body: {
      "username": username,
      "email": email,
      "password": password,
    });
    // if (response.statusCode == 200) {
    //   Map json = jsonDecode(response.body);
    //   String token = json["access_token"];
    //   var box = await Hive.openBox(tokenBox);
    //   box.put("token", token);
    //   await getUserLogin(token);
    // }
    print(response.body);
    return LoginResponse.fromJson(jsonDecode(response.body));
  }
  // ==> (End)
}

class RegistrationResponse {
  List<dynamic>? non_field_error;
  dynamic key;
  List<dynamic>? password1;
  List<dynamic>? username;
  List<dynamic>? email;
  RegistrationResponse(
      {this.email,
      this.key,
      this.non_field_error,
      this.password1,
      this.username});
  factory RegistrationResponse.fromJson(MapOfBody) {
    return RegistrationResponse(
      email: MapOfBody["email"],
      key: MapOfBody["key"],
      non_field_error: MapOfBody["non_field_error"],
      password1: MapOfBody["password1"],
      username: MapOfBody["username"],
    );
  }
}

class LoginResponse {
  List<dynamic>? non_field_error;
  dynamic key;
  LoginResponse({
    this.key,
    this.non_field_error,
  });
  factory LoginResponse.fromJson(MapOfBody) {
    return LoginResponse(
      key: MapOfBody["key"],
      non_field_error: MapOfBody["non_field_error"],
    );
  }
}

// getUserLogin(String token) async {
//   var url = Uri.parse("https://smartsips-production.up.railway.app/auth/user/");
//   var res = await http.get(url, headers: {"Authorization": "Token $token"});
//   print(res.body);
//   print(res.statusCode);
//   if (res.statusCode == 200) {
//     var json = jsonDecode(res.body);
//     LoginResponse userLogin = LoginResponse.fromJson(json);
//     userLogin.token
//   }
// }
