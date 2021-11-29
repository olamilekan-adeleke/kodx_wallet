import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:kodx_wallet_mobile/cores/utils/navigator_service.dart';
import 'package:kodx_wallet_mobile/cores/utils/route_name.dart';
import '../../../cores/constants/error_text.dart';
import '../../../cores/utils/emums.dart';
import '../../../cores/utils/logger.dart';
import '../../../cores/utils/snack_bar_service.dart';
import '../../../features/auth/services/auth_services.dart';

class LoginControllers extends GetxController {
  final Rx<ControllerState> _controllerStateEnum = ControllerState.init.obs;
  static final AuthenticationRepo _authenticationRepo =
      Get.find<AuthenticationRepo>();
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  ControllerState get controllerStateEnum => _controllerStateEnum.value;

  Future<void> loginUser() async {
    _controllerStateEnum.value = ControllerState.busy;
    try {
      await _authenticationRepo.loginUserWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      _controllerStateEnum.value = ControllerState.success;
      CustomSnackBarService.showSuccessSnackBar('Success', 'Login Successful!');
      NavigationService.popAllAndPlace(RouteName.homeTab);
    } on FormatException catch (_) {
      _controllerStateEnum.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar(
        'Error',
        'Unable to format data!, something went wrong',
      );
    } on SocketException {
      _controllerStateEnum.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar(
          'Error', noInternetConnectionText);
    } catch (e, s) {
      errorLog('$e', 'Error logging in user', title: 'login', trace: '$s');
      _controllerStateEnum.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar('Error', e.toString());
    }
  }
}
