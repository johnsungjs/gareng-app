// To parse this JSON data, do
//
//     final profileEditRequest = profileEditRequestFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileEditRequest profileEditRequestFromJson(String str) =>
    ProfileEditRequest.fromJson(json.decode(str));

String profileEditRequestToJson(ProfileEditRequest data) =>
    json.encode(data.toJson());

class ProfileEditRequest {
  final String gender;
  final String age;
  final String address;
  final String email;

  ProfileEditRequest({
    required this.gender,
    required this.age,
    required this.address,
    required this.email,
  });

  factory ProfileEditRequest.fromJson(Map<String, dynamic> json) =>
      ProfileEditRequest(
        gender: json["Gender"],
        age: json["Age"],
        address: json["Address"],
        email: json["Email"],
      );

  Map<String, dynamic> toJson() => {
        "Gender": gender,
        "Age": age,
        "Address": address,
        "Email": email,
      };
}
