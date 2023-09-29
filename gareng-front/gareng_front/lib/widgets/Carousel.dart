import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final PageController pageController;

  final ScrollController scrollController = ScrollController();
  int pageNo = 0;

  Timer? carouselTimer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 5) {
        pageNo = 0;
      }
      if (scrollController.hasClients) {
        pageController.animateToPage(
          pageNo,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCirc,
        );
      }
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carouselTimer = getTimer();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              pageNo = index;
              setState(() {});
            },
            itemBuilder: (_, index) {
              return AnimatedBuilder(
                  animation: pageController,
                  builder: (ctx, child) {
                    return child!;
                  },
                  child: GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("you clicked index no $index"),
                        ),
                      );
                    },
                    onPanDown: (d) {
                      carouselTimer?.cancel();
                      carouselTimer = null;
                    },
                    onPanCancel: () {
                      carouselTimer = getTimer();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          right: 8, left: 8, top: 36, bottom: 12),
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                'https://i0.wp.com/pointsgeek.id/wp-content/uploads/2018/09/Go-Food.jpg?fit=1200%2C628&ssl=1',
                              ),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.amber),
                    ),
                  ));
            },
            itemCount: 5,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                5,
                (index) => GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        child: Icon(
                          Icons.circle,
                          size: 12,
                          color: pageNo == index
                              ? Colors.indigoAccent
                              : Colors.grey.shade300,
                        ),
                      ),
                    )))
      ],
    );
  }
}
