import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gareng_front/constants/FormatCurrency.dart';
import 'package:gareng_front/models/cart_controller.dart';
import 'package:gareng_front/models/item_controller.dart';
import 'package:gareng_front/pages/DetailItem.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CardGrid extends StatelessWidget {
  CardGrid({super.key});
  // final currencyFormatter = NumberFormat.currency(locale: 'ID', symbol: "Rp");

  final cartController = Get.put(CartController());

  final CartController controller = Get.find();

  final ItemController itemController = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 300,
        ),
        itemCount: itemController.stateItemData.value.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() =>
                  DetailItem(itemData: itemController.stateItemData[index]));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color.fromARGB(255, 208, 208, 208),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                    child: Image.network(
                      itemController.stateItemData.value[index].imageUrl,
                      height: 170,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemController.stateItemData.value[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 8,
                          width: double.infinity,
                        ),
                        Text(
                          FormatCurrency.indo.format(int.parse(
                              itemController.stateItemData.value[index].price)),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 8,
                          width: double.infinity,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(CupertinoIcons.heart)),
                            Stack(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      itemController.addItem(itemController
                                          .stateItemData.value[index]);
                                    },
                                    icon: const Icon(CupertinoIcons.cart)),
                                Text(
                                    '${itemController.getItemQuantity(itemController.stateItemData[index])}'),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
