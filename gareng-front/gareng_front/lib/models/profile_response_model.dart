// To parse this JSON data, do
//
//     final profileResponseModel = profileResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileResponseModel profileResponseModelFromJson(String str) =>
    ProfileResponseModel.fromJson(json.decode(str));

String profileResponseModelToJson(ProfileResponseModel data) =>
    json.encode(data.toJson());

class ProfileResponseModel {
  final Data data;
  final String message;
  final int status;

  ProfileResponseModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileResponseModel(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  final String username;
  final String gender;
  final String address;
  final String email;
  final String age;

  Data({
    required this.username,
    required this.gender,
    required this.address,
    required this.email,
    required this.age,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        gender: json["gender"],
        address: json["address"],
        email: json["email"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "gender": gender,
        "address": address,
        "email": email,
        "age": age,
      };
}
