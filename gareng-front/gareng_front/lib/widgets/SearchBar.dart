import 'package:flutter/material.dart';
import 'package:gareng_front/models/cart_controller.dart';
import 'package:get/get.dart';

import '../models/product_model.dart';

class SearchBar extends StatefulWidget {
  SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController inputUser = TextEditingController();

  var searchResult = [];

  final CartController controller = Get.find();

  // @override
  // void initState() {
  //   inputUser.addListener(_printLatestValue);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   inputUser.dispose();
  //   super.dispose();
  // }

  // void _printLatestValue() {
  //   controller.getListSearchResult(inputUser.text);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(36)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (text) {
            controller.getListSearchResult(text);
          },
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'Search Your Food Here',
            labelStyle: const TextStyle(color: Colors.grey),
            icon: IconButton(
                onPressed: () {
                  print(controller.filteredData);
                  // print(controller.inputUser.text);
                },
                icon: Icon(Icons.search)),
            border: InputBorder.none,
            iconColor: Colors.grey[800],
          ),
          cursorColor: Colors.grey[800],
          cursorHeight: 20,
          // controller: controller.inputUser,
        ),
      ),
    );
  }
}
