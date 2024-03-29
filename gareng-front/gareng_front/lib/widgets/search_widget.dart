import 'package:flutter/material.dart';
import 'package:gareng_front/models/cart_controller.dart';
import 'package:gareng_front/models/item_controller.dart';
import 'package:gareng_front/models/item_request_model.dart';
import 'package:gareng_front/services/api_service.dart';
import 'package:get/get.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key});
  final TextEditingController inputUser = TextEditingController();

  final CartController controller = Get.find();
  final ItemController itemController = Get.put(ItemController());
  final APIService apiService = APIService();

  void filterData() {
    itemController.stateItemData.value = [];
    itemController.resetGetItemBody();
    GetItemPagination reqbody = GetItemPagination(
        pageAt: itemController.page.value,
        sizePerPage: 6,
        search: itemController.searchInput.value);
    ItemRequestModel model = ItemRequestModel(getItemPagination: reqbody);
    apiService.getAllItem(model).then((e) => {
          if (e.data.itemData.isEmpty)
            {
              itemController.hasMore.value = false,
            }
          else
            {
              itemController.addStateItemData(e.data.itemData),
              itemController.page.value++,
              itemController.isLoading.value = false,
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(36)),
      child: TextField(
        onChanged: (text) {
          itemController.setSearchInput(text);
        },
        onSubmitted: (value) =>
            {filterData(), FocusManager.instance.primaryFocus?.unfocus()},
        obscureText: false,
        decoration: InputDecoration(
          hintText: 'Search Your Food Here',
          labelStyle: const TextStyle(color: Colors.grey),
          icon: IconButton(
              onPressed: () {
                filterData();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              icon: const Icon(Icons.search)),
          border: InputBorder.none,
          iconColor: Colors.grey[800],
        ),
        cursorColor: Colors.grey[800],
        cursorHeight: 20,
      ),
    );
  }
}
