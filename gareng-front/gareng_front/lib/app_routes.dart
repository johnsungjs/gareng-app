import 'package:flutter/src/widgets/framework.dart';
import 'package:gareng_front/pages/AccountEditPage.dart';
import 'package:gareng_front/pages/Core.dart';
import 'package:gareng_front/pages/backupDetailItem.dart';
import 'package:gareng_front/pages/success_pay_page.dart';
import 'package:gareng_front/pages/transaction_page.dart';
import 'package:gareng_front/pages/login_page.dart';
import 'package:gareng_front/pages/register_page.dart';
import 'package:get/get.dart';

appRoutes(Widget _defaultHome) => [
      GetPage(
        name: '/',
        page: () => _defaultHome,
        transition: Transition.fadeIn,
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
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/home',
        page: () => Core(
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
        page: () => AccountEditPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];
