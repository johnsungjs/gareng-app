// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:gareng_front/models/cart_controller.dart';
// import 'package:gareng_front/models/product_model.dart';
// import 'package:gareng_front/pages/DetailItem.dart';
// import 'package:get/get.dart';

// class CardGrid extends StatelessWidget {
//   CardGrid({super.key});

//   final cartController = Get.put(CartController());

//   final CartController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => GridView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 12,
//           mainAxisSpacing: 12,
//           mainAxisExtent: 300,
//         ),
//         itemCount: controller.filteredData.value.length,
//         itemBuilder: (_, index) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => DetailItem(
//                         item: Product.products[index],
//                       )));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 color: Colors.grey.shade100,
//               ),
//               child: Column(
//                 children: [
//                   ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(16),
//                         topRight: Radius.circular(16)),
//                     child: Image.network(
//                       controller.filteredData.value[index].images,
//                       height: 170,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           controller.filteredData.value[index].title,
//                           style: const TextStyle(
//                               fontWeight: FontWeight.w700, fontSize: 18),
//                         ),
//                         const SizedBox(
//                           height: 8,
//                           width: double.infinity,
//                         ),
//                         Text(
//                           controller.filteredData.value[index].price,
//                           style: const TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w500),
//                         ),
//                         const SizedBox(
//                           height: 8,
//                           width: double.infinity,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             IconButton(
//                                 onPressed: () {},
//                                 icon: const Icon(CupertinoIcons.heart)),
//                             IconButton(
//                                 onPressed: () {
//                                   controller.addProduct(
//                                       controller.filteredData.value[index]);
//                                 },
//                                 icon: const Icon(CupertinoIcons.cart)),
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
