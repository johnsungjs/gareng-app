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
          padding: const EdgeInsets.all(24.0),
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
                    IconButton(onPressed: () {}, icon: const Icon(Icons.abc)),
                    const Text("Location"),
                    const Text("Notif Logo"),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Carousel(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Popular Food"),
                    Text("View All"),
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
