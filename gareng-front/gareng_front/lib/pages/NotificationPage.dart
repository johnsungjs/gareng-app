import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gareng_front/constants/notifDummy.dart';
import 'package:gareng_front/models/cart_controller.dart';
import 'package:gareng_front/models/product_model.dart';
import 'package:gareng_front/pages/Core.dart';
import 'package:gareng_front/widgets/NotifContainer.dart';
import 'package:get/get.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
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
              "Notifications",
              style: TextStyle(color: Colors.grey[900]),
            ),
            SizedBox(
              width: 30,
            )
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: notifDummy.length,
          itemBuilder: (_, index) {
            return NotifContainer(
              title: notifDummy.elementAt(index)["title"],
              content: notifDummy.elementAt(index)["content"],
              time: notifDummy.elementAt(index)["time"],
            );
          }),
    );
  }
}
