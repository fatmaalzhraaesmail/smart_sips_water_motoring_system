class Profile {
  int? id;
  String? token;

  String? username;
  String? phone_number;
  String? address;
  String? email;
  String? password;
  String? country;

  Profile(
      {this.id,
      this.token,
      this.username,
      this.password,
      this.phone_number,
      this.country,
      this.address,
      this.email});

  factory Profile.fromJson(json) {
    return Profile(
      token: json["token"],
      email: json["email"],
      password: json["password"],
      address: json["address"],
      country: json["country"],
      phone_number: json["phone_number"],
      id: json["id"],
      username: json["username"],
    );
  }
  Map<String, dynamic> toDatabaseJson() => {
        "token": token,
        "id": id,
        "email": email,
        "username": username,
        "password": password,
        "phone_number": phone_number,
        "country": country,
        "address": address
      };
}
