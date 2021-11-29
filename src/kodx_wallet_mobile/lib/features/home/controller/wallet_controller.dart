import 'dart:io';

import 'package:get/get.dart';
import 'package:kodx_wallet_mobile/cores/constants/error_text.dart';
import 'package:kodx_wallet_mobile/cores/utils/emums.dart';
import 'package:kodx_wallet_mobile/cores/utils/logger.dart';
import 'package:kodx_wallet_mobile/cores/utils/snack_bar_service.dart';
import 'package:kodx_wallet_mobile/features/home/model/wallet_model.dart';
import 'package:kodx_wallet_mobile/features/home/services/wallet_services.dart';

class WalletController extends GetxController {
  final WalletService walletService = WalletService();
  final Rx<ControllerState> controllerState = ControllerState.init.obs;
  Rx<WalletModel>? walletData;

  Future<void> getWalletData() async {
    controllerState.value = ControllerState.busy;
    try {
      final WalletModel? _walletData = await walletService.getWalletData();

      if (_walletData == null) {
        controllerState.value = ControllerState.error;
        CustomSnackBarService.showErrorSnackBar(
          'Error',
          'Opps, Unable to get your wallet details! \nsomething went wrong',
        );
        return;
      }

      walletData = Rx<WalletModel>(_walletData);

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
    getWalletData();
    super.onReady();
  }
}
