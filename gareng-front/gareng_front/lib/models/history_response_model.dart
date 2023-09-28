import 'dart:convert';

HistoryResponseModel historyResponseModelFromJson(String str) =>
    HistoryResponseModel.fromJson(json.decode(str));

class HistoryResponseModel {
  final Data data;
  final String message;
  final int status;

  HistoryResponseModel(
      {required this.data, required this.message, required this.status});

  factory HistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      HistoryResponseModel(
          data: Data.fromJson(json["data"]),
          message: json["message"],
          status: json["status"]);

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
      };
}

class Data {
  final List<TransactionHeaders> transactionHeaders;

  Data({required this.transactionHeaders});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      transactionHeaders: List<TransactionHeaders>.from(
          json["transactionHeaders"]
              .map((x) => TransactionHeaders.fromJson(x))));

  Map<String, dynamic> toJson() => {"transactionHeaders": transactionHeaders};
}

class TransactionHeaders {
  final String id;
  final String uuid;
  final String imageUrl;
  final String transactionDate;
  final String payment;
  final String userUUID;
  final String paymentMethod;

  TransactionHeaders(
      {required this.id,
      required this.uuid,
      required this.imageUrl,
      required this.transactionDate,
      required this.payment,
      required this.userUUID,
      required this.paymentMethod});

  factory TransactionHeaders.fromJson(Map<String, dynamic> json) =>
      TransactionHeaders(
          id: json["id"],
          uuid: json["uuid"],
          imageUrl: json["imageUrl"],
          transactionDate: json["transactionDate"],
          payment: json["payment"],
          userUUID: json["userUUID"],
          paymentMethod: json["paymentMethod"]);
}
