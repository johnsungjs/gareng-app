import 'package:flutter/material.dart';
import 'package:gareng_front/models/cart_controller.dart';
import 'package:gareng_front/models/product_model.dart';
import 'package:get/get.dart';
import 'package:gareng_front/widgets/CardTotal.dart';

class CartPage extends StatelessWidget {
  final CartController controller = Get.find();

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
                    height: 600,
                    child: ListView.builder(
                        itemCount: controller.products.length,
                        itemBuilder: (_, index) {
                          return CartProductCard(
                            controller: controller,
                            product: controller.products.keys.toList()[index],
                            quantity:
                                controller.products.values.toList()[index],
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
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  const CartProductCard(
      {super.key,
      required this.controller,
      required this.product,
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
            backgroundImage: NetworkImage(product.images),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(product.title),
          ),
          IconButton(
              onPressed: () {
                controller.removeProduct(product);
              },
              icon: Icon(Icons.remove_circle)),
          Text("$quantity"),
          IconButton(
              onPressed: () {
                controller.addProduct(product);
              },
              icon: Icon(Icons.add_circle)),
        ],
      ),
    );
  }
}
