import 'package:flutter/material.dart';
import 'package:gareng_front/models/item_controller.dart';
import 'package:get/get.dart';

class FloatingOrderButton extends StatelessWidget {
  FloatingOrderButton({super.key});

  final ItemController itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Get.toNamed("/transaction");
      },
      backgroundColor: Colors.black,
      label: Text(
        '${itemController.items.value.length} item selected with total ${itemController.total}',
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
