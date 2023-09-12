import 'dart:convert';

TransactionResponseModel transactionResponseModelFromJson(String str) =>
    TransactionResponseModel.fromJson(json.decode(str));

String transactionResponseModelToJson(TransactionResponseModel data) =>
    json.encode(data.toJson());

class TransactionResponseModel {
  final Data data;
  final String message;
  final int status;

  TransactionResponseModel(
      {required this.data, required this.message, required this.status});

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      TransactionResponseModel(
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
  final String transactionUUID;
  Data({
    required this.transactionUUID,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(transactionUUID: json["transactionUUID"]);

  Map<String, String> toJson() => {
        "transactionUUID": transactionUUID,
      };
}
