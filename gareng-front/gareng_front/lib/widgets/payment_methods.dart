import 'package:flutter/material.dart';
import 'package:gareng_front/models/item_controller.dart';
import 'package:get/get.dart';

import '../constants/custom_style.dart';

class PaymentMethods extends StatelessWidget {
  PaymentMethods({super.key, required this.paymentMethod});
  final ItemController itemController = Get.put(ItemController());
  final String paymentMethod;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextButton(
        onPressed: () {
          itemController.setPaymentMethod(paymentMethod);
          Navigator.pop(context);
        },
        style: ButtonStyle(
          side: const MaterialStatePropertyAll(BorderSide(
              color: customBlack, width: 1.0, style: BorderStyle.solid)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
        ),
        child: Text(
          paymentMethod.isNotEmpty ? paymentMethod : "Cancel",
          style: const TextStyle(color: customBlack),
        ),
      ),
    );
  }
}
