import 'package:flutter/material.dart';
import 'package:gareng_front/models/cart_controller.dart';
import 'package:gareng_front/models/item_controller.dart';
import 'package:gareng_front/models/profile_controller.dart';
import 'package:gareng_front/services/api_service.dart';
import 'package:gareng_front/widgets/card_grid.dart';
import 'package:gareng_front/widgets/carousel.dart';
import 'package:gareng_front/widgets/search_widget.dart';
import 'package:gareng_front/widgets/user_greetings.dart';
import 'package:get/get.dart';

import '../models/item_request_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();

  final APIService apiService = APIService();
  final cartController = Get.put(CartController());
  final ItemController itemController = Get.put(ItemController());
  final ProfileController profilecontroller = Get.put(ProfileController());

  Future fetch() async {
    if (itemController.isLoading.value) return;
    GetItemPagination reqBody = GetItemPagination(
        pageAt: itemController.page.value,
        sizePerPage: 6,
        search: itemController.searchInput.value);
    ItemRequestModel model = ItemRequestModel(getItemPagination: reqBody);
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

  Future refresh() async {
    itemController.setSearchInput('');
    itemController.isLoading.value = false;
    itemController.hasMore.value = true;
    itemController.page.value = 1;
    itemController.stateItemData.value = [];

    fetch();
  }

  @override
  void initState() {
    super.initState();

    apiService.getProfile();

    fetch();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (itemController.hasMore.value) {
          //fetch
          debugPrint('fetch more');
          fetch();
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
            child: SearchWidget(),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: UserGreetings()),
                const Carousel(),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Our Menu",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(24), child: CardGrid()),
                Obx(
                  () => Center(
                    child: itemController.hasMore.value
                        ? const CircularProgressIndicator()
                        : const Text(('No More Data')),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
