import 'package:get/get.dart';
import 'package:kodx_wallet_mobile/features/home/services/wallet_services.dart';

class WalletController extends GetxController {
  final WalletService walletService = WalletService();

  void getWalletData() {}

  @override
  void onReady() {
    getWalletData();
    super.onReady();
  }
}
