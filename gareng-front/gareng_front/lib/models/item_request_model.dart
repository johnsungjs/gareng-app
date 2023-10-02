// To parse this JSON data, do
//
//     final itemRequestModel = itemRequestModelFromJson(jsonString);

import 'dart:convert';

ItemRequestModel itemRequestModelFromJson(String str) =>
    ItemRequestModel.fromJson(json.decode(str));

String itemRequestModelToJson(ItemRequestModel data) =>
    json.encode(data.toJson());

class ItemRequestModel {
  final GetItemPagination getItemPagination;

  ItemRequestModel({
    required this.getItemPagination,
  });

  factory ItemRequestModel.fromJson(Map<String, dynamic> json) =>
      ItemRequestModel(
        getItemPagination:
            GetItemPagination.fromJson(json["getItemPagination"]),
      );

  Map<String, dynamic> toJson() => {
        "getItemPagination": getItemPagination.toJson(),
      };
}

class GetItemPagination {
  final int pageAt;
  final int sizePerPage;
  final String search;

  GetItemPagination({
    required this.pageAt,
    required this.sizePerPage,
    required this.search,
  });

  factory GetItemPagination.fromJson(Map<String, dynamic> json) =>
      GetItemPagination(
        pageAt: json["pageAt"],
        sizePerPage: json["sizePerPage"],
        search: json["search"],
      );

  Map<String, dynamic> toJson() => {
        "pageAt": pageAt,
        "sizePerPage": sizePerPage,
        "search": search,
      };
}
