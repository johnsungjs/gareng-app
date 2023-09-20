import 'package:flutter/material.dart';
import 'package:gareng_front/widgets/items_test.dart';
import 'package:get/get.dart';
import 'package:gareng_front/widgets/CardTotal.dart';

import '../models/item_controller.dart';

class CartPage extends StatelessWidget {
  final ItemController itemController = Get.put(ItemController());

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                ItemsTest()
              ],
            ),
          ),
        ),
        CardTotal()
      ],
    );
  }
}
