import 'dart:io';

import 'package:get/get.dart';
import 'package:kodx_wallet_mobile/cores/constants/error_text.dart';
import 'package:kodx_wallet_mobile/cores/utils/emums.dart';
import 'package:kodx_wallet_mobile/cores/utils/logger.dart';
import 'package:kodx_wallet_mobile/cores/utils/snack_bar_service.dart';
import 'package:kodx_wallet_mobile/features/auth/model/user_details_model.dart';
import 'package:kodx_wallet_mobile/features/home/services/user_service.dart';

class GetUserDetailsController extends GetxController {
  final UserService userService = UserService();
  final Rx<ControllerState> controllerState = ControllerState.init.obs;
  Rx<UserDetailsModel>? userDetails;

  Future<void> getUserData() async {
    controllerState.value = ControllerState.busy;
    try {
      final UserDetailsModel? _userDetails = await userService.getUser();

      if (_userDetails == null) {
        controllerState.value = ControllerState.error;
        CustomSnackBarService.showErrorSnackBar(
          'Error',
          'Opps, Unable to get your details! \nsomething went wrong',
        );
        return;
      }

      userDetails = Rx<UserDetailsModel>(_userDetails);

      controllerState.value = ControllerState.success;
    } on FormatException catch (_) {
      controllerState.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar(
        'Error',
        'Unable to format data!, something went wrong',
      );
    } on SocketException {
      controllerState.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar(
        'Error',
        noInternetConnectionText,
      );
    } catch (e, s) {
      errorLog('$e', 'Error logging in user', title: 'login', trace: '$s');
      controllerState.value = ControllerState.error;
      CustomSnackBarService.showErrorSnackBar('Error', e.toString());
    }
  }

  @override
  void onReady() {
    getUserData();
    super.onReady();
  }
}
