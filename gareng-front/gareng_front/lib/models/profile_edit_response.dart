// To parse this JSON data, do
//
//     final profileEditResponse = profileEditResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileEditResponse profileEditResponseFromJson(String str) =>
    ProfileEditResponse.fromJson(json.decode(str));

String profileEditResponseToJson(ProfileEditResponse data) =>
    json.encode(data.toJson());

class ProfileEditResponse {
  final Data data;
  final String message;
  final int status;

  ProfileEditResponse({
    required this.data,
    required this.message,
    required this.status,
  });

  factory ProfileEditResponse.fromJson(Map<String, dynamic> json) =>
      ProfileEditResponse(
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
  final String message;

  Data({
    required this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
      };
}
