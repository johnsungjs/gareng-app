import 'package:gareng_front/constants/itemsDummy.dart';

class Product {
  final String title;
  final String price;
  final String images;

  const Product(
      {required this.title, required this.price, required this.images});

  // static const List<Product> products = [
  //   Product(title: "title", price: "50000", images: "images"),
  //   Product(title: "title", price: "50000", images: "images"),
  //   Product(title: "title", price: "50000", images: "images"),
  // ];

  static List<Product> products = (itemsDummy.map((e) =>
          (Product(title: e["title"], price: e["price"], images: e["images"]))))
      .toList();
}
