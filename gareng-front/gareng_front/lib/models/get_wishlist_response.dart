// To parse this JSON data, do
//
//     final getWishlistResponse = getWishlistResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetWishlistResponse getWishlistResponseFromJson(String str) =>
    GetWishlistResponse.fromJson(json.decode(str));

String getWishlistResponseToJson(GetWishlistResponse data) =>
    json.encode(data.toJson());

class GetWishlistResponse {
  final Data data;
  final String message;
  final int status;

  GetWishlistResponse({
    required this.data,
    required this.message,
    required this.status,
  });

  factory GetWishlistResponse.fromJson(Map<String, dynamic> json) =>
      GetWishlistResponse(
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
  final List<ItemData> itemData;

  Data({
    required this.getItemPagination,
    required this.itemData,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        getItemPagination:
            GetItemPagination.fromJson(json["getItemPagination"]),
        itemData: List<ItemData>.from(
            json["itemData"].map((x) => ItemData.fromJson(x))),
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

class ItemData {
  final String price;
  final String title;
  final String uuid;
  final String imageUrl;

  ItemData({
    required this.price,
    required this.title,
    required this.uuid,
    required this.imageUrl,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) => ItemData(
        price: json["price"],
        title: json["title"],
        uuid: json["uuid"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "title": title,
        "uuid": uuid,
        "imageUrl": imageUrl,
      };
}
