import 'package:flutter/material.dart';
import 'package:gareng_front/models/cart_controller.dart';
import 'package:gareng_front/models/product_model.dart';
import 'package:get/get.dart';
import 'package:gareng_front/widgets/CardTotal.dart';

import '../models/item_controller.dart';
import '../models/item_response_model.dart';

class CartPage extends StatelessWidget {
  final CartController controller = Get.find();
  final ItemController itemController = Get.put(ItemController());

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Your Shopping Cart",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    // height: 600,
                    height: 500,
                    child: ListView.builder(
                        itemCount: itemController.items.length,
                        itemBuilder: (_, index) {
                          return CartProductCard(
                            itemController: itemController,
                            itemData: itemController.items.keys.toList()[index],
                            quantity:
                                itemController.items.values.toList()[index],
                            index: index,
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

class CartProductCard extends StatelessWidget {
  final ItemController itemController;
  final ItemData itemData;
  final int quantity;
  final int index;

  const CartProductCard(
      {super.key,
      required this.itemController,
      required this.itemData,
      required this.quantity,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(itemData.imageUrl),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(itemData.title),
          ),
          IconButton(
              onPressed: () {
                itemController.removeItem(itemData);
              },
              icon: Icon(Icons.remove_circle)),
          SizedBox(width: 20, child: Center(child: Text("$quantity"))),
          IconButton(
              onPressed: () {
                itemController.addItem(itemData);
              },
              icon: Icon(Icons.add_circle)),
        ],
      ),
    );
  }
}
