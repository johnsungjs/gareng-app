// To parse this JSON data, do
//
//     final registerRequestModel = registerRequestModelFromJson(jsonString);

import 'dart:convert';

class RegisterRequestModel {
  final String username;
  final String password;
  final String address;
  final String gender;
  final int age;
  final String email;

  RegisterRequestModel({
    required this.username,
    required this.password,
    required this.address,
    required this.gender,
    required this.age,
    required this.email,
  });

  factory RegisterRequestModel.fromRawJson(String str) =>
      RegisterRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      RegisterRequestModel(
        username: json["Username"],
        password: json["Password"],
        address: json["Address"],
        gender: json["Gender"],
        age: json["Age"],
        email: json["Email"],
      );

  Map<String, dynamic> toJson() => {
        "Username": username,
        "Password": password,
        "Address": address,
        "Gender": gender,
        "Age": age,
        "Email": email,
      };
}
