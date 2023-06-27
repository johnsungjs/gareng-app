import 'package:flutter/material.dart';
import 'package:gareng_front/app_routes.dart';
import 'package:gareng_front/pages/Core.dart';
import 'package:gareng_front/pages/login_page.dart';
import 'package:get/get.dart';

import 'models/token_controller.dart';

Widget _defaultHome = Core(selectedIndex: 0);

void main() async {
  final TokenController tokenController = Get.put(TokenController());
  bool _result = tokenController.isLoggedIn();
  if (_result) {
    _defaultHome = Core(selectedIndex: 0);
  } else {
    _defaultHome = LoginPage();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: appRoutes(_defaultHome),
    );
  }
}
