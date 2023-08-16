class User {
 late final int pk ;
 late final String token ;
 late final String username;
 late final String email ;
 late final String password1;
 late final String password2 ;
  User({
    required this.email,
   required this.pk,
   required this.token,
   required this.username,
   required this.password1,
   required this.password2,
  });
  factory User.fromJson(json) {
    return User(
      email: json["email"],
      password1: json["password1"],
      password2: json["password2"],
      pk: json["pk"],
      username: json["username"],
      token: json['access_token'],
    );
  }
  Map<String, dynamic> toDatabaseJson() => {
        "pk": pk,
        "email": email,
        "username": username,
        "password1": password1,
        "password2": password2,
        "access_token": token,
      };
}
// =======
//  late int id;
//   late final String first_name;
//   late final String last_name;
//   late final String email;
//   late final String password;
//   late final String re_password;

//   User({required this.first_name, required this.last_name,required this.email,required this.password,required this.re_password});

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//          first_name: json['first_name'], last_name: json['last_name'],email: json['email'],password: json['password'],re_password: json['repassword'] );
//   }
//   dynamic toJson() => {'first_name': first_name, 'last_name': last_name,'email':email,'password':password,'re_password':re_password};
// }

// class Activiation{
//   late final String uid;
//   late final String token;
//   Activiation({required this.uid, required this.token});
//   factory Activiation.fromJson(Map<String, dynamic> json) {
//     return Activiation(
//          uid: json['uid'], token: json['token'] );
//   }
//   dynamic toJson() => {'uid': uid, 'token': token};
// }


// >>>>>>> 1426091833c4b3d42e9b3703ede5ade5bbde3438
