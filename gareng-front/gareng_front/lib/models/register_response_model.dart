// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterResponseModel registerResponseModel(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

class RegisterResponseModel {
  final Data? data;
  final String message;
  final int status;

  RegisterResponseModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory RegisterResponseModel.fromRawJson(String str) =>
      RegisterResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        data: json['data'] != null ? Data.fromJson(json["data"]) : null,
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  final User user;

  Data({
    required this.user,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["User"]),
      );

  Map<String, dynamic> toJson() => {
        "User": user.toJson(),
      };
}

class User {
  final int id;
  final String uuid;
  final String username;
  final String password;
  final String address;
  final String gender;
  final int age;
  final String email;

  User({
    required this.id,
    required this.uuid,
    required this.username,
    required this.password,
    required this.address,
    required this.gender,
    required this.age,
    required this.email,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        address: json["address"],
        gender: json["gender"],
        age: json["age"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "username": username,
        "password": password,
        "address": address,
        "gender": gender,
        "age": age,
        "email": email,
      };
}
