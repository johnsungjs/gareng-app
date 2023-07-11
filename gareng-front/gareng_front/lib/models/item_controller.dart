import 'dart:collection';
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

  final RxList _items = [].obs;

  void addItem(ItemData itemData) {
    debugPrint('${itemData.title} added');

    final dataExist =
        _items.firstWhereOrNull((e) => e["uuid"] == itemData.uuid);

    if (dataExist == null) {
      _items.add({
        "uuid": itemData.uuid,
        "title": itemData.title,
        "price": itemData.price,
        "imageUrl": itemData.imageUrl,
        "quantity": 1
      });
      Get.snackbar(
        "Items Added",
        "You have added ${itemData.title} to the cart",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 1),
      );
    } else {
      final int desiredIndex =
          _items.indexWhere((e) => e["uuid"] == itemData.uuid);

      _items[desiredIndex] = {
        "uuid": itemData.uuid,
        "title": itemData.title,
        "price": itemData.price,
        "imageUrl": itemData.imageUrl,
        "quantity": dataExist["quantity"] + 1
      };
    }
  }

  void removeItem(ItemData itemData) {
    final dataExist =
        _items.firstWhereOrNull((e) => e["uuid"] == itemData.uuid);

    if (dataExist != null) {
      if (dataExist["quantity"] == 1) {
        _items.removeWhere((e) => e["uuid"] == itemData.uuid);
      } else {
        final desiredIndex =
            _items.indexWhere((e) => e["uuid"] == itemData.uuid);
        _items[desiredIndex] = {
          "uuid": itemData.uuid,
          "title": itemData.title,
          "price": itemData.price,
          "imageUrl": itemData.imageUrl,
          "quantity": dataExist["quantity"] - 1
        };
      }
    } else {
      debugPrint('ngaco neh data null di delete');
    }
  }

  get items => _items;

  get itemSubtotal =>
      _items.map((e) => e["quantity"] * int.parse(e["price"])).toList();

//total seluruh belanjaan
  String getTotalItem() {
    if (_items.isEmpty) {
      return "0";
    } else {
      List itemSubtotal =
          _items.map((e) => e["quantity"] * int.parse(e["price"])).toList();
      var subtotal = 0;
      itemSubtotal.forEach((e) {
        subtotal += e as int;
      });
      return subtotal.toString();
    }
  }

  get total => getTotalItem();

  int getItemQuantity(ItemData itemData) {
    final dataExist =
        _items.firstWhereOrNull((e) => e["uuid"] == itemData.uuid);

    //kalau ada return quantity hashmap
    if (dataExist != null) {
      return dataExist['quantity'];
    } else {
      return 0;
    }
  }
}


//OPSI 1 (beserta old code)

    //ubah _items bagian key nya jadi list<itemData>
    //bool exist => check list<itemData> ada itemData.uuid atau ngga
    //masukin exist kedalem conditional

// class ItemController extends GetxController {
//   RxBool hasMore = true.obs;
//   RxInt page = 1.obs;
//   RxBool isLoading = false.obs;

//   void resetGetItemBody() {
//     hasMore.value = true;
//     page.value = 1;
//     isLoading.value = false;
//   }

//   RxList stateItemData = [].obs;

//   void addStateItemData(List<ItemData> listItemData) {
//     stateItemData.addAll(listItemData);
//   }

//   RxString searchInput = "".obs;
//   void setSearchInput(String inputUser) {
//     searchInput.value = inputUser;
//   }

//   var _items = {}.obs;

//   void addItem(ItemData itemData) {
//     if (kDebugMode) {
//       print('${itemData.title} added');
//     }

//     if (_items.containsKey(itemData)) {
//       _items[itemData] += 1;
//     } else {
//       _items[itemData] = 1;
//       Get.snackbar(
//         "Items Added",
//         "You have added ${itemData.title} to the cart",
//         snackPosition: SnackPosition.TOP,
//         duration: const Duration(seconds: 1),
//       );
//     }
//   }

//   void removeItem(ItemData itemData) {
//     if (_items.containsKey(itemData) && _items[itemData] == 1) {
//       _items.removeWhere((key, value) => key == itemData);
//     } else {
//       _items[itemData] -= 1;
//     }
//   }

//   get items => _items;

//   get itemSubtotal => _items.entries.map((e) => e.key.price * e.value).toList();

//   String getTotalItem() {
//     if (_items.isEmpty) {
//       return "0";
//     } else {
//       return _items.entries
//           .map((e) => int.parse(e.key.price) * e.value)
//           .toList()
//           .reduce((value, element) => value + element)
//           .toString();
//     }
//   }

//   get total => getTotalItem();

//   int getItemQuantity(ItemData itemData) {
//     if (_items.containsKey(itemData)) {
//       return _items[itemData];
//     } else {
//       return 0;
//     }
//   }
// }
