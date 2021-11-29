import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodx_wallet_mobile/features/auth/views/pages/wrapper.dart';

List<GetPage<Widget>> pages() {
  return <GetPage<Widget>>[
    GetPage(name: '/', page: () => const WrapperScreen()),
    GetPage(name: '/login', page: () => const WrapperScreen()),
    GetPage(name: '/sign_up', page: () => const WrapperScreen()),
  ];
}
