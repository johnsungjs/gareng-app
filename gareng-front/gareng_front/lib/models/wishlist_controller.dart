import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'get_wishlist_response.dart';

class WishlistController extends GetxController {
  RxBool hasMore = true.obs;
  RxInt page = 1.obs;
  RxBool isLoading = false.obs;

  void resetGetWishlistBody() {
    hasMore.value = true;
    page.value = 1;
    isLoading.value = false;
  }

  RxList stateWishlistData = [].obs;

  void addStateWishlistData(List<ItemData> listWishlist) {
    stateWishlistData.addAll(listWishlist);
  }

  RxString searchInput = "".obs;
  void setSearchInput(String inputUser) {
    searchInput.value = inputUser;
  }
}
