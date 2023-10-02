// To parse this JSON data, do
//
//     final refreshTokenResponseModel = refreshTokenResponseModelFromJson(jsonString);

import 'dart:convert';

RefreshTokenResponseModel refreshTokenResponseModelFromJson(String str) =>
    RefreshTokenResponseModel.fromJson(json.decode(str));

String refreshTokenResponseModelToJson(RefreshTokenResponseModel data) =>
    json.encode(data.toJson());

class RefreshTokenResponseModel {
  final Data data;
  final String message;
  final int status;

  RefreshTokenResponseModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory RefreshTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      RefreshTokenResponseModel(
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
  final String accessToken;

  Data({
    required this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
      };
}
