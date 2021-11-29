import 'dart:io';
import '../model/user_details_model.dart';
import '../../../cores/constants/error_text.dart';
import '../../../cores/utils/emums.dart';
import '../../../cores/utils/logger.dart';
import '../../../cores/utils/navigator_service.dart';
import '../../../cores/utils/snack_bar_service.dart';
import '../../../features/auth/services/auth_services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

class RegisterController extends GetxController {
  final Rx<ControllerState> _controllerStateEnum = ControllerState.init.obs;
  static final AuthenticationRepo _authenticationRepo =
      Get.find<AuthenticationRepo>();
  final TextEditingController fullNameController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController phoneController = TextEditingController(text: '');
  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  ControllerState get controllerStateEnum => _controllerStateEnum.value;

  Future<void> registerUser() async {
    _controllerStateEnum.value = ControllerState.busy;

    final UserDetailsModel user = UserDetailsModel(
      userId: '',
      email: emailController.text.trim(),
      fullName: fullNameController.text.trim(),
      phoneNumber: phoneController.text.trim(),
      profilePicUrl: null,
      username: usernameController.text.trim(),
    );

    try {
      final Map<String, dynamic>? result =
          await _authenticationRepo.registerUserWithEmailAndPassword(
        user,
        passwordController.text.trim(),
      );

      if (result == null) {
        _controllerStateEnum.value = ControllerState.error;
        CustomSnackBarService.showErrorSnackBar(
          'Error',
          'Opps, Something went wrong. Please try again!',
        );
        return;
      }

      if (result['status'] == 'success') {
        _controllerStateEnum.value = ControllerState.success;
        NavigationService.goBack();
        await Future.delayed(const Duration(milliseconds: 300));
        CustomSnackBarService.showSuccessSnackBar(
          'Success',
          'Account Successfully Created!',
        );
      } else {
        _controllerStateEnum.value = ControllerState.error;
        CustomSnackBarService.showErrorSnackBar('Error', result['msg']);
        return;
      }
    } on SocketException {
      _controllerStateEnum.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar(
        'Error',
        noInternetConnectionText,
      );
    } on FormatException catch (_) {
      _controllerStateEnum.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar(
        'Error',
        'Unable to format data!, something went wrong',
      );
    } catch (e, s) {
      errorLog('$e', 'Error signing up in user', title: 'sign up', trace: '$s');
      _controllerStateEnum.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar('Error', e.toString());
    }
  }
}
