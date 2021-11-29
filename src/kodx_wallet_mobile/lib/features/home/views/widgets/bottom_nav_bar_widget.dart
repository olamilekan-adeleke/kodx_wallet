import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kodx_wallet_mobile/cores/constants/color.dart';
import 'package:kodx_wallet_mobile/features/home/controller/home_controller.dart';

Widget bottomNavBarWidget() {
  final HomeController homeController = Get.find<HomeController>();

  return Obx(() {
    return BottomNavigationBar(
      selectedItemColor: kcPrimaryColor,
      selectedLabelStyle: GoogleFonts.raleway(
        fontWeight: FontWeight.w600,
        color: kcPrimaryColor,
      ),
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: GoogleFonts.raleway(
        fontWeight: FontWeight.w500,
        color: kcTextColor,
      ),
      showUnselectedLabels: true,
      currentIndex: homeController.tabIndex.value,
      onTap: (int index) => homeController.updateTabIndex(index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.send),
          label: 'Transfer',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt_rounded),
          label: 'Transaction',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  });
}
