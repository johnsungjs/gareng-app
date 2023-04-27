import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gareng_front/constants/itemsDummy.dart';

class CardGrid extends StatefulWidget {
  const CardGrid({super.key});

  @override
  State<CardGrid> createState() => _CardGridState();
}

class _CardGridState extends State<CardGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 300,
      ),
      itemCount: itemsDummy.length,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.amberAccent.shade100,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                child: Image.network(
                  itemsDummy.elementAt(index)['images'],
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
                      itemsDummy.elementAt(index)['title'],
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .merge(const TextStyle(
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                      width: double.infinity,
                    ),
                    Text(
                      itemsDummy.elementAt(index)['price'],
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                          TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade500)),
                    ),
                    const SizedBox(
                      height: 8,
                      width: double.infinity,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.heart)),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.cart)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
