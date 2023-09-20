import 'package:flutter/src/widgets/framework.dart';
import 'package:gareng_front/pages/Core.dart';
import 'package:gareng_front/pages/backupDetailItem.dart';
import 'package:gareng_front/pages/transaction_page.dart';
import 'package:gareng_front/pages/login_page.dart';
import 'package:gareng_front/pages/register_page.dart';
import 'package:get/get.dart';

appRoutes(Widget _defaultHome) => [
      GetPage(
        name: '/',
        page: () => _defaultHome,
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/login',
        page: () => LoginPage(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/register',
        page: () => RegisterPage(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/home',
        page: () => Core(
          selectedIndex: 0,
        ),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/transaction',
        page: () => TransactionPage(),
        transition: Transition.downToUp,
        transitionDuration: Duration(milliseconds: 500),
      ),
    ];
