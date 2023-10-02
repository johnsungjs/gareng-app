// To parse this JSON data, do
//
//     final loginRequestModel = loginRequestModelFromJson(jsonString);

import 'dart:convert';

class LoginRequestModel {
  final String username;
  final String password;

  LoginRequestModel({
    required this.username,
    required this.password,
  });

  factory LoginRequestModel.fromRawJson(String str) =>
      LoginRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginRequestModel(
        username: json["Username"],
        password: json["Password"],
      );

  Map<String, dynamic> toJson() => {
        "Username": username,
        "Password": password,
      };
}
