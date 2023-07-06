import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gareng_front/config.dart';
import 'package:gareng_front/models/item_request_model.dart';
import 'package:gareng_front/models/item_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ItemController extends GetxController {
  RxBool hasMore = true.obs;
  RxInt page = 1.obs;
  RxBool isLoading = false.obs;

  void resetGetItemBody() {
    hasMore.value = true;
    page.value = 1;
    isLoading.value = false;
  }

  RxList stateItemData = [].obs;

  void addStateItemData(List<ItemData> listItemData) {
    stateItemData.addAll(listItemData);
  }

  RxString searchInput = "".obs;
  void setSearchInput(String inputUser) {
    searchInput.value = inputUser;
  }

  var _items = {}.obs;

  void addItem(ItemData itemData) {
    if (kDebugMode) {
      print('${itemData.title} added');
    }
    if (_items.containsKey(itemData)) {
      _items[itemData] += 1;
    } else {
      _items[itemData] = 1;
      Get.snackbar(
        "Items Added",
        "You have added ${itemData.title} to the cart",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 1),
      );
    }
  }

  void removeItem(ItemData itemData) {
    if (_items.containsKey(itemData) && _items[itemData] == 1) {
      _items.removeWhere((key, value) => key == itemData);
    } else {
      _items[itemData] -= 1;
    }
  }

  get items => _items;

  get itemSubtotal => _items.entries.map((e) => e.key.price * e.value).toList();

  String getTotalItem() {
    if (_items.isEmpty) {
      return "0";
    } else {
      return _items.entries
          .map((e) => int.parse(e.key.price) * e.value)
          .toList()
          .reduce((value, element) => value + element)
          .toString();
    }
  }

  get total => getTotalItem();

  int getItemQuantity(ItemData itemData) {
    if (_items.containsKey(itemData)) {
      return _items[itemData];
    } else {
      return 0;
    }
  }
}
