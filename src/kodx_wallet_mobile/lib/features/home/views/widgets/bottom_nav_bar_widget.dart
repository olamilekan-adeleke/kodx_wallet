import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kodx_wallet_mobile/cores/constants/color.dart';

BottomNavigationBar bottomNavBarWidget() {
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
}
