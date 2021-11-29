import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodx_wallet_mobile/features/home/controller/home_controller.dart';

Widget homeTabBodyWidget() {
  final HomeController homeController = Get.find<HomeController>();

  return Obx(() {
    return IndexedStack(
      index: homeController.tabIndex.value,
      children: [
        Container(child: Center(child: Text('home'))),
        Container(child: Center(child: Text('transer'))),
        Container(child: Center(child: Text('transaction'))),
        Container(child: Center(child: Text('profile'))),
      ],
    );
  });
}
