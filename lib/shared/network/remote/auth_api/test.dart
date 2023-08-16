// import 'dart:core';
// import 'package:graduation_project/shared/network/remote/auth_api/auth.dart';
// import 'package:http/http.dart' as http;

// main() async {
//   AuthServices authServices = AuthServices();
//   final logOutUrl = Uri.parse(
//       'https://smartsips-production.up.railway.app/user_api/auth/logout/');
//   var logOutResponse = await http.get(logOutUrl, headers: {
//     "Authorization":
//         "Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg0MzY4NjU0LCJpYXQiOjE2ODE3NzY2NTQsImp0aSI6ImEyYWZjYTNlNWU5NDRhOTU4M2ZiNTU1N2QyYjRmODRhIiwidXNlcl9pZCI6MTJ9.JYqx2QqTmUDXGYkwKn-ejFUTQ6JBaC_6PG_1RZoGbRM",
//   });
//   print(logOutResponse.body);
//   var UserResponse = await http.get(
//       Uri.parse(
//           'https://smartsips-production.up.railway.app/user_api/%7Bid%7D/userprofile/update'),
//       headers: {
//         "Authorization":
//             "Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg0MzY4NjU0LCJpYXQiOjE2ODE3NzY2NTQsImp0aSI6ImEyYWZjYTNlNWU5NDRhOTU4M2ZiNTU1N2QyYjRmODRhIiwidXNlcl9pZCI6MTJ9.JYqx2QqTmUDXGYkwKn-ejFUTQ6JBaC_6PG_1RZoGbRM",
//       });
//   print(UserResponse.body);
//   RegistrationResponse? registrationResponse = await authServices.registration(
//       "nadamonir", "nadamonir1992@gmail.com", "nada123456", "nada123456");

//   // ignore: unnecessary_null_comparison
//   if (registrationResponse != null) {
//     if (registrationResponse.email != null) {
//       for (var element in registrationResponse.email!) {
//         print(element);
//       }
//     }
//     if (registrationResponse.username != null) {
//       for (var element in registrationResponse.username!) {
//         print(element);
//       }
//     }
//     if (registrationResponse.password1 != null) {
//       for (var element in registrationResponse.password1!) {
//         print(element);
//       }
//     }
//     if (registrationResponse.non_field_error != null) {
//       for (var element in registrationResponse.non_field_error!) {
//         print(element);
//       }
//     }
//     if (registrationResponse.key != null) {
//       print(registrationResponse.key);
//     }
//   }
//   LoginResponse? loginResponse = await authServices.LogIn(
//     "NadaMonir",
//     "nadamonir1992@gmail.com",
//     "nada123456"
//   );
//   if (loginResponse != null) {
//     if (loginResponse.key != null) {
//       print(loginResponse.key);
//     }
//     if (loginResponse.non_field_error != null) {
//       for (var element in loginResponse.non_field_error!) {
//         print(element);
//       }
//     }
//   }
// }


// // token :eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjg0MzY4NjU0LCJpYXQiOjE2ODE3NzY2NTQsImp0aSI6ImEyYWZjYTNlNWU5NDRhOTU4M2ZiNTU1N2QyYjRmODRhIiwidXNlcl9pZCI6MTJ9.JYqx2QqTmUDXGYkwKn-ejFUTQ6JBaC_6PG_1RZoGbRM","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY4MTg2MzA1NCwiaWF0IjoxNjgxNzc2NjU0LCJqdGkiOiI0MzM2NTUyZjI2MzA0YjI5ODJhOTdlNDNkNTFkOTNhZiIsInVzZXJfaWQiOjEyfQ.6lHFZ3bZobijK4IX_hAVGS2LqQqRp8FlhJAwezchJek