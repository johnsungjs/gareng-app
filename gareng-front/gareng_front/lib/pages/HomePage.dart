import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gareng_front/models/cart_controller.dart';
import 'package:gareng_front/pages/NotificationPage.dart';
import 'package:gareng_front/widgets/CardGrid.dart';
import 'package:gareng_front/widgets/Carousel.dart';
import 'package:gareng_front/widgets/CustomCard.dart';
import 'package:gareng_front/widgets/SearchBar.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: SearchBar(),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Hello John!",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NotificationPage()));
                        },
                        icon: const Icon(Icons.notifications_active_outlined)),
                  ],
                ),
              ),
              const Carousel(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Our Menu",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              // Text("Grids Of Menu"),
              Padding(padding: const EdgeInsets.all(24), child: CardGrid()),
            ]),
          ),
        ),
      ],
    );
  }
}
