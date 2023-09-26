import 'package:flutter/material.dart';
import 'package:gareng_front/models/profile_controller.dart';
import 'package:gareng_front/pages/NotificationPage.dart';
import 'package:get/get.dart';

class UserGreetings extends StatelessWidget {
  UserGreetings({super.key});
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(
          () => Text(
            "Hello ${profileController.dataUser["username"]}!",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        IconButton(
            onPressed: () {
              Get.to(NotificationPage());
            },
            icon: const Icon(Icons.notifications_active_outlined)),
      ],
    );
  }
}
