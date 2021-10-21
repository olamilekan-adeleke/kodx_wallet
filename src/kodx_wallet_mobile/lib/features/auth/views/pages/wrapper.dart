import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

import '../../../../cores/utils/emums.dart';
import '../../../../cores/utils/local_database_controller.dart';
import '../../../../features/auth/controllers/auth_state_controller.dart';
import '../../../../features/auth/views/pages/login_screen.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen();

  static final AuthStateController authStateController =
      Get.find<AuthStateController>();
  static final LocalDatabaseController localDatabaseController =
      Get.find<LocalDatabaseController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (authStateController.authStateEnum.value == AuthStateEnum.loggedIn &&
            localDatabaseController.hasUserData) {
          return const Scaffold();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
