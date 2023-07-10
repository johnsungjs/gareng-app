import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gareng_front/constants/FormatCurrency.dart';
import 'package:gareng_front/models/cart_controller.dart';
import 'package:gareng_front/models/item_controller.dart';
import 'package:gareng_front/models/product_model.dart';
import 'package:gareng_front/pages/Core.dart';
import 'package:get/get.dart';

import '../models/item_response_model.dart';

class DetailItem extends StatelessWidget {
  // Product item;
  ItemData itemData;
  DetailItem({super.key, required this.itemData});

  // final CartController controller = Get.find();
  final ItemController itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    // var productQuantity = controller.getProductQuantity(item);
    int itemQuantity = itemController.getItemQuantity(itemData);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
            ),
            Text(
              "Detail",
              style: TextStyle(color: Colors.grey[900]),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Image.network(itemData.imageUrl),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      itemData.title,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const Icon(Icons.star),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      //FormatCurrency.indo.format(int.parse(itemController.stateItemData.value[index].price)),
                      // "Rp.${itemController.total}",
                      FormatCurrency.indo.format(int.parse(itemData.price)),
                      style: const TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              if (itemQuantity > 0) {
                                itemController.removeItem(itemData);
                                // itemQuantity =
                                // itemController.getItemQuantity(itemData);
                              } else {
                                null;
                              }
                            },
                            icon: const Icon(Icons.remove)),
                        Text(
                          "${itemController.getItemQuantity(itemData)}",
                          style: const TextStyle(fontSize: 18),
                        ),
                        IconButton(
                            onPressed: () {
                              itemController.addItem(itemData);
                              // itemQuantity =
                              //     itemController.getItemQuantity(itemData);
                            },
                            icon: const Icon(Icons.add)),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          FormatCurrency.indo
                              .format(int.parse(itemController.total)),
                          style: TextStyle(fontSize: 28),
                        ),
                        const Text(
                          "Total Price",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    FilledButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.all(22),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.black)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Add to Cart",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
