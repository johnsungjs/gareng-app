import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gareng_front/models/product_model.dart';

class DetailItem extends StatefulWidget {
  DetailItem({super.key, required this.item});

  Product item;

  @override
  State<DetailItem> createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {
  int itemQuantity = 0;

  void increaseQuantity() {
    setState(() {
      itemQuantity++;
    });
  }

  void decreaseQuantity() {
    setState(() {
      if (itemQuantity > 0) {
        itemQuantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int itemPriceTotal = int.parse(widget.item.price) * itemQuantity;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
            ),
            Text(
              "Detail",
              style: TextStyle(color: Colors.grey[900]),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.item.images),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.item.title,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const Icon(Icons.star),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.item.price,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: decreaseQuantity,
                          icon: const Icon(Icons.remove)),
                      Text(
                        "$itemQuantity",
                        style: const TextStyle(fontSize: 18),
                      ),
                      IconButton(
                          onPressed: increaseQuantity,
                          icon: const Icon(Icons.add)),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Rp.$itemPriceTotal",
                        style: TextStyle(fontSize: 28),
                      ),
                      const Text(
                        "Total Price",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  // TextButton(
                  //     onPressed: () {}, child: const Text("Place Order")),
                  FilledButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(22),
                          ),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.black)),
                      onPressed: () {},
                      child: const Text(
                        "Place Order",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
