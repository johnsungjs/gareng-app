// To parse this JSON data, do
//
//     final itemResponseModel = itemResponseModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ItemResponseModel itemResponseModelFromJson(String str) =>
    ItemResponseModel.fromJson(json.decode(str));

String itemResponseModelToJson(ItemResponseModel data) =>
    json.encode(data.toJson());

class ItemResponseModel {
  final Data data;
  final String message;
  final int status;

  ItemResponseModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory ItemResponseModel.fromJson(Map<String, dynamic> json) =>
      ItemResponseModel(
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
  final GetItemPagination getItemPagination;
  final List<ItemDatum> itemData;

  Data({
    required this.getItemPagination,
    required this.itemData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        getItemPagination:
            GetItemPagination.fromJson(json["getItemPagination"]),
        itemData: List<ItemDatum>.from(
            json["itemData"].map((x) => ItemDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "getItemPagination": getItemPagination.toJson(),
        "itemData": List<dynamic>.from(itemData.map((x) => x.toJson())),
      };
}

class GetItemPagination {
  final int pageAt;
  final int totalPage;
  final int total;
  final int sizePerPage;
  final String search;

  GetItemPagination({
    required this.pageAt,
    required this.totalPage,
    required this.total,
    required this.sizePerPage,
    required this.search,
  });

  factory GetItemPagination.fromJson(Map<String, dynamic> json) =>
      GetItemPagination(
        pageAt: json["pageAt"],
        totalPage: json["totalPage"],
        total: json["total"],
        sizePerPage: json["sizePerPage"],
        search: json["search"],
      );

  Map<String, dynamic> toJson() => {
        "pageAt": pageAt,
        "totalPage": totalPage,
        "total": total,
        "sizePerPage": sizePerPage,
        "search": search,
      };
}

class ItemDatum {
  final String title;
  final String price;
  final String uuid;
  final String imageUrl;

  ItemDatum({
    required this.title,
    required this.price,
    required this.uuid,
    required this.imageUrl,
  });

  factory ItemDatum.fromJson(Map<String, dynamic> json) => ItemDatum(
        title: json["title"],
        price: json["price"],
        uuid: json["uuid"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "uuid": uuid,
        "imageUrl": imageUrl,
      };
}
