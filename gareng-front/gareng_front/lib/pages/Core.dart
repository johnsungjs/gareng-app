import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gareng_front/models/item_controller.dart';
import 'package:gareng_front/pages/HomePage.dart';

import 'package:gareng_front/pages/AccountPage.dart';
import 'package:gareng_front/pages/WishlistPage.dart';
import 'package:gareng_front/pages/history_page.dart';
import 'package:gareng_front/widgets/floating_order_button.dart';
import 'package:get/get.dart';

class Core extends StatefulWidget {
  final int selectedIndex;
  Core({super.key, required this.selectedIndex});
  // final cartController = Get.put(CartController());

  @override
  State<Core> createState() => _CoreState();
}

class _CoreState extends State<Core> {
  late int _selectedIndex;
  final ItemController itemController = Get.put(ItemController());

  @override
  void initState() {
    // TODO: implement initState
    _selectedIndex = widget.selectedIndex;
  }

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HistoryPage(),
    WishlistPage(),
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
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueGrey[50],
          floatingActionButton: Obx(
            () => _selectedIndex == 0 && itemController.isFabVisible.value
                ? FloatingOrderButton()
                : const SizedBox.shrink(),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              if (notification.direction == ScrollDirection.forward) {
                if (!itemController.isFabVisible.value) {
                  setState(() {
                    // isFabVisible = true;
                    itemController.setIsFabVisible(true);
                  });
                }
              } else if (notification.direction == ScrollDirection.reverse) {
                if (itemController.isFabVisible.value) {
                  setState(() {
                    // isFabVisible = false;
                    itemController.setIsFabVisible(false);
                  });
                }
              }
              return true;
            },
            child: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: 'History'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Wishlist'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Account'),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color.fromARGB(255, 0, 42, 77),
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
