import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import '../../../../cores/utils/local_database_controller.dart';
import '../../../../features/auth/views/pages/login_screen.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  
  static final LocalDatabaseController localDatabaseController =
      Get.find<LocalDatabaseController>();

  @override
  Widget build(BuildContext context) {
    // return Obx(
    //   () {
    //     if (authStateController.authStateEnum.value == AuthStateEnum.loggedIn &&
    //         localDatabaseController.hasUserData) {
    //       return const Scaffold(body: Center(child: Text('home')));
    //     } else {
          
    //     }
    //   },
    // );
    return const LoginScreen();
  }
}

