// To parse this JSON data, do
//
//     final refreshTokenRequestModel = refreshTokenRequestModelFromJson(jsonString);

import 'dart:convert';

RefreshTokenRequestModel refreshTokenRequestModelFromJson(String str) =>
    RefreshTokenRequestModel.fromJson(json.decode(str));

String refreshTokenRequestModelToJson(RefreshTokenRequestModel data) =>
    json.encode(data.toJson());

class RefreshTokenRequestModel {
  final String username;

  RefreshTokenRequestModel({
    required this.username,
  });

  factory RefreshTokenRequestModel.fromJson(Map<String, dynamic> json) =>
      RefreshTokenRequestModel(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}
