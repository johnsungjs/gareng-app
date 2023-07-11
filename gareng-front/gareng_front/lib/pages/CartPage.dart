import 'package:flutter/material.dart';
import 'package:gareng_front/models/item_response_model.dart';
import 'package:get/get.dart';
import 'package:gareng_front/widgets/CardTotal.dart';

import '../models/item_controller.dart';

class CartPage extends StatelessWidget {
  final ItemController itemController = Get.put(ItemController());

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Your Shopping Cart",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 500,
                    child: ListView.builder(
                        itemCount: itemController.items.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(
                                      itemController.items[index]["imageUrl"]),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Text(
                                      itemController.items[index]["title"]),
                                ),
                                IconButton(
                                    onPressed: () {
                                      ItemData itemData = ItemData(
                                          title: itemController.items[index]
                                              ["title"],
                                          price: itemController.items[index]
                                              ["price"],
                                          uuid: itemController.items[index]
                                              ["uuid"],
                                          imageUrl: itemController.items[index]
                                              ["imageUrl"]);

                                      itemController.removeItem(itemData);
                                    },
                                    icon: const Icon(Icons.remove_circle)),
                                SizedBox(
                                    width: 20,
                                    child: Center(
                                        child: Text(
                                            '${itemController.items[index]["quantity"]}'))),
                                IconButton(
                                    onPressed: () {
                                      ItemData itemData = ItemData(
                                          title: itemController.items[index]
                                              ["title"],
                                          price: itemController.items[index]
                                              ["price"],
                                          uuid: itemController.items[index]
                                              ["uuid"],
                                          imageUrl: itemController.items[index]
                                              ["imageUrl"]);

                                      itemController.addItem(itemData);
                                    },
                                    icon: const Icon(Icons.add_circle)),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
          CardTotal()
        ],
      ),
    );
  }
}
