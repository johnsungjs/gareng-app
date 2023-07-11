import 'package:flutter/material.dart';
import 'package:gareng_front/models/cart_controller.dart';
import 'package:gareng_front/pages/CartPage.dart';
import 'package:gareng_front/pages/HomePage.dart';

import 'package:gareng_front/pages/AccountPage.dart';
import 'package:gareng_front/pages/WishlistPage.dart';
import 'package:get/get.dart';

class Core extends StatefulWidget {
  int selectedIndex;
  Core({super.key, required this.selectedIndex});
  final cartController = Get.put(CartController());

  @override
  State<Core> createState() => _CoreState();
}

class _CoreState extends State<Core> {
  late int _selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    _selectedIndex = widget.selectedIndex;
  }

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CartPage(),
    const WishlistPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Wishlist'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 0, 42, 77),
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
