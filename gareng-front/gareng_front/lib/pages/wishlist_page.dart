import 'package:flutter/material.dart';
import 'package:gareng_front/models/cart_controller.dart';
import 'package:gareng_front/models/profile_controller.dart';
import 'package:gareng_front/models/wishlist_controller.dart';
import 'package:gareng_front/services/api_service.dart';
import 'package:gareng_front/widgets/card_grid.dart';
import 'package:gareng_front/widgets/search_widget.dart';
import 'package:get/get.dart';

class WishlistPage extends StatefulWidget {
  WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final scrollController = ScrollController();

  final APIService apiService = APIService();
  final cartController = Get.put(CartController());
  // final ItemController itemController = Get.put(ItemController());
  final WishlistController wishlistController = Get.put(WishlistController());
  final ProfileController profilecontroller = Get.put(ProfileController());

  Future fetch() async {
    if (wishlistController.isLoading.value) return;

    Map jsonReqBody = {
      "getItemPagination": {
        "pageAt": wishlistController.page.value,
        "sizePerPage": 6,
        "search": wishlistController.searchInput.value
      }
    };

    apiService.getAllWishlist(jsonReqBody).then((e) => {
          if (e.data.itemData.isEmpty)
            {
              wishlistController.hasMore.value = false,
            }
          else
            {
              wishlistController.addStateWishlistData(e.data.itemData),
              wishlistController.page.value++,
              wishlistController.isLoading.value = false,
            }
        });
  }

  Future refresh() async {
    wishlistController.setSearchInput('');
    wishlistController.isLoading.value = false;
    wishlistController.hasMore.value = true;
    wishlistController.page.value = 1;
    wishlistController.stateWishlistData.value = [];

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
        if (wishlistController.hasMore.value) {
          //fetch
          debugPrint('fetch more');
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
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
            child: SearchWidget(),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "My Wishlist",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(padding: const EdgeInsets.all(24), child: CardGrid()),
                Obx(
                  () => Center(
                    child: wishlistController.hasMore.value
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
