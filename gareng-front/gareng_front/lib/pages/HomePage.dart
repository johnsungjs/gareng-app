import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gareng_front/widgets/CardGrid.dart';
import 'package:gareng_front/widgets/Carousel.dart';
import 'package:gareng_front/widgets/CustomCard.dart';
import 'package:gareng_front/widgets/SearchBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                        onPressed: () {},
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
              const Padding(padding: EdgeInsets.all(24), child: CardGrid()),
            ]),
          ),
        ),
      ],
    );
  }
}
