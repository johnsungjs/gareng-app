// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:gareng_front/pages/account_edit_page.dart';
import 'package:gareng_front/pages/core.dart';
import 'package:gareng_front/pages/success_pay_page.dart';
import 'package:gareng_front/pages/transaction_page.dart';
import 'package:gareng_front/pages/login_page.dart';
import 'package:gareng_front/pages/register_page.dart';
import 'package:get/get.dart';

appRoutes(Widget defaultHome) => [
      GetPage(
        name: '/',
        page: () => defaultHome,
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/login',
        page: () => const LoginPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/register',
        page: () => const RegisterPage(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/home',
        page: () => const Core(
          selectedIndex: 0,
        ),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/transaction',
        page: () => TransactionPage(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/success-pay',
        page: () => SuccessPayPage(),
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/account-edit',
        page: () => const AccountEditPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];
