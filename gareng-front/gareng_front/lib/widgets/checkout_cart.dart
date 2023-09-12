import 'package:flutter/material.dart';
import 'package:gareng_front/constants/itemsDummy.dart';
import 'package:gareng_front/models/item_controller.dart';
import 'package:gareng_front/models/item_response_model.dart';
import 'package:get/get.dart';

import '../constants/custom_style.dart';

class CheckoutCart extends StatelessWidget {
  final ItemController itemController = Get.put(ItemController());
  CheckoutCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dataDummy = itemsDummy;
    return Obx(() => SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: ListView.builder(
              itemCount: itemController.items.length,
              itemBuilder: (_, index) {
                return Container(
                  padding: EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              itemController.items[index]["imageUrl"],
                              width: 75,
                              height: 75,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(itemController.items[index]["title"]),
                                Text(
                                  itemController.items[index]["price"],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order Quantity:',
                            style: TextStyle(
                                color: customBlack,
                                fontWeight: FontWeight.w400),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  ItemData itemData = ItemData(
                                      title: itemController.items[index]
                                          ["title"],
                                      price: itemController.items[index]
                                          ["price"],
                                      uuid: itemController.items[index]["uuid"],
                                      imageUrl: itemController.items[index]
                                          ["imageUrl"]);

                                  itemController.removeItem(itemData);
                                },
                                icon: Icon(Icons.remove_circle_outline),
                              ),
                              SizedBox(
                                  width: 20,
                                  child: Center(
                                      child: Text(
                                          '${itemController.items[index]["amount"]}'))),
                              IconButton(
                                onPressed: () {
                                  ItemData itemData = ItemData(
                                      title: itemController.items[index]
                                          ["title"],
                                      price: itemController.items[index]
                                          ["price"],
                                      uuid: itemController.items[index]["uuid"],
                                      imageUrl: itemController.items[index]
                                          ["imageUrl"]);
                                  itemController.addItem(itemData);
                                },
                                icon: Icon(Icons.add_circle),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
        ));
  }
}
