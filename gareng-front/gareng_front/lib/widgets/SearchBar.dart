import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar({super.key});

  TextEditingController inputUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(36)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'Search Your Food Here',
            labelStyle: const TextStyle(color: Colors.grey),
            icon: const Icon(Icons.search),
            border: InputBorder.none,
            iconColor: Colors.grey[800],
          ),
          cursorColor: Colors.grey[800],
          cursorHeight: 20,
          controller: inputUser,
        ),
      ),
    );
  }
}
