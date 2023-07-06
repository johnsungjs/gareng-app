import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gareng_front/models/cart_controller.dart';
import 'package:gareng_front/models/item_controller.dart';
import 'package:gareng_front/models/profile_controller.dart';
import 'package:gareng_front/pages/NotificationPage.dart';
import 'package:gareng_front/services/api_service.dart';
import 'package:gareng_front/widgets/CardGrid.dart';
import 'package:gareng_front/widgets/Carousel.dart';
import 'package:gareng_front/widgets/CustomCard.dart';
import 'package:gareng_front/widgets/SearchBar.dart';
import 'package:get/get.dart';

import '../models/item_request_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  // bool hasMore = true;
  // int page = 1;
  // bool isLoading = false;

  final APIService apiService = APIService();
  final cartController = Get.put(CartController());
  final ItemController itemController = Get.put(ItemController());
  final ProfileController profilecontroller = Get.put(ProfileController());

  Future fetch() async {
    if (itemController.isLoading.value) return;
    // print('page state: ${itemController.page.value}');
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
              // itemController.stateItemData.value = e.data.itemData,
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

    apiService
        .getProfile()
        .then((value) => profilecontroller.setDataUser(value.data.toJson()));

    fetch();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (itemController.hasMore.value) {
          //fetch
          print('fetch more');
          fetch();
        }
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
            padding: const EdgeInsets.all(18.0),
            child: SearchBar(),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(children: [
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Hello John!",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NotificationPage()));
                          },
                          icon:
                              const Icon(Icons.notifications_active_outlined)),
                    ],
                  ),
                ),
                const Carousel(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Our Menu",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                // Text("Grids Of Menu"),
                Padding(padding: const EdgeInsets.all(24), child: CardGrid()),
                Obx(
                  () => Center(
                    child: itemController.hasMore.value
                        ? const CircularProgressIndicator()
                        : const Text(('No More Data')),
                  ),
                ),
                SizedBox(
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
