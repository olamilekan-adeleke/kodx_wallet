import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodx_wallet_mobile/features/home/controller/home_controller.dart';
import 'package:kodx_wallet_mobile/features/home/views/screens/home_screen.dart';
import 'package:kodx_wallet_mobile/features/transactions/views/screens/transaction_screen.dart';

Widget homeTabBodyWidget() {
  final HomeController homeController = Get.find<HomeController>();

  return Obx(() {
    return IndexedStack(
      index: homeController.tabIndex.value,
      children: [
        const HomeScreen(),
        Container(child: Center(child: Text('transer'))),
        const TransactionScreen(),
        Container(child: Center(child: Text('profile'))),
      ],
    );
  });
}
