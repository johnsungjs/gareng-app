import 'package:flutter/material.dart';
import 'package:gareng_front/app_routes.dart';
import 'package:gareng_front/pages/login_page.dart';
import 'package:get/get.dart';

Widget _defaultHome = const LoginPage();

void main() async {
  // bool _result = await SharedService.isLoggedIn();
  // if (_result) {
  //   _defaultHome = HomePage();
  // }

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
