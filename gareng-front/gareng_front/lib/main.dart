import 'package:flutter/material.dart';
import 'package:gareng_front/app_routes.dart';
import 'package:gareng_front/pages/login_page.dart';
import 'package:get/get.dart';

Widget _defaultHome = const LoginPage();
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // String? token = prefs.getString('token');
  // if (token != null) {
  //   debugPrint('token ada isi: $token');
  //   _defaultHome = Core(selectedIndex: 0);
  // } else {
  //   debugPrint('token null: $token');
  //   _defaultHome = const LoginPage();
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: appRoutes(_defaultHome),
    );
  }
}
