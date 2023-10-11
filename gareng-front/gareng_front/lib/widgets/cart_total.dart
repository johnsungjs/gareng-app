import 'package:flutter/material.dart';
import 'package:gareng_front/models/cart_controller.dart';
import 'package:gareng_front/models/item_controller.dart';
import 'package:get/get.dart';

class CardTotal extends StatelessWidget {
  final CartController controller = Get.find();
  final ItemController itemController = Get.put(ItemController());
  CardTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                "Rp.${itemController.total}",
                style: const TextStyle(fontSize: 28),
              ),
              const Text(
                "Total Price",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          // TextButton(
          //     onPressed: () {}, child: const Text("Place Order")),
          FilledButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.all(22),
                  ),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.black)),
              onPressed: () {
                Get.toNamed('/transaction');
              },
              child: const Text(
                "Place Order",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}
