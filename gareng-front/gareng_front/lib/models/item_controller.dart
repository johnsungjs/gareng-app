import 'dart:convert';

import 'package:gareng_front/config.dart';
import 'package:gareng_front/models/item_request_model.dart';
import 'package:gareng_front/models/item_response_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ItemController extends GetxController {
  RxList stateItemData = [].obs;

  var _items = {}.obs;

  void addItem(ItemData itemData) {
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

  void removeProduct(ItemData itemData) {
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

  int getProductQuantity(ItemData itemData) {
    if (_items.containsKey(itemData)) {
      return _items[itemData];
    } else {
      return 0;
    }
  }
}
