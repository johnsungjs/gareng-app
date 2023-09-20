import 'package:flutter/material.dart';
import 'package:gareng_front/models/item_controller.dart';
import 'package:gareng_front/models/item_response_model.dart';
import 'package:get/get.dart';

//INI ITEM CART YANG BERHASIL DI GENERATE, JADI NEXT TIME BIASAIN AJA KALAU ADA LISTVIEW BUILDER ITU DIBUAT DI WIDGET YANG TERPISAH

class ItemsTest extends StatelessWidget {
  final ItemController itemController = Get.put(ItemController());
  ItemsTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 500,
        child: ListView.builder(
            itemCount: itemController.items.length,
            itemBuilder: (_, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        itemController.items[index]["imageUrl"],
                        width: 75,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(itemController.items[index]["title"]),
                    ),
                    IconButton(
                        onPressed: () {
                          ItemData itemData = ItemData(
                              title: itemController.items[index]["title"],
                              price: itemController.items[index]["price"],
                              uuid: itemController.items[index]["uuid"],
                              imageUrl: itemController.items[index]
                                  ["imageUrl"]);

                          itemController.removeItem(itemData);
                        },
                        icon: const Icon(Icons.remove_circle)),
                    SizedBox(
                        width: 20,
                        child: Center(
                            child: Text(
                                '${itemController.items[index]["amount"]}'))),
                    IconButton(
                        onPressed: () {
                          ItemData itemData = ItemData(
                              title: itemController.items[index]["title"],
                              price: itemController.items[index]["price"],
                              uuid: itemController.items[index]["uuid"],
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
    );
  }
}
