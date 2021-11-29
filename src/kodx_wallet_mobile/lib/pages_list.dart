import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodx_wallet_mobile/features/auth/views/pages/wrapper.dart';

import 'cores/utils/route_name.dart';
import 'features/auth/views/pages/forgot_password_screen.dart';
import 'features/auth/views/pages/login_screen.dart';
import 'features/auth/views/pages/signup_screen.dart';

List<GetPage<Widget>> pages() {
  return <GetPage<Widget>>[
    GetPage(name: RouteName.initial, page: () => const WrapperScreen()),
    GetPage(name: RouteName.login, page: () => const LoginScreen()),
    GetPage(name: RouteName.signup, page: () => const SignUpScreen()),
    GetPage(
      name: RouteName.forgotPassword,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
        name: RouteName.forgotPassword,
        page: () => const ForgotPasswordScreen()),
  ];
}
