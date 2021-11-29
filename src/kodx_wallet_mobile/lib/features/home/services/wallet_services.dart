import 'dart:convert';
import 'dart:developer';

import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'package:kodx_wallet_mobile/cores/utils/api.dart';
import 'package:kodx_wallet_mobile/features/auth/services/auth_services.dart';
import 'package:kodx_wallet_mobile/features/home/model/wallet_model.dart';

class WalletService {
  final AuthenticationRepo authenticationRepo = Get.find<AuthenticationRepo>();

  Future<WalletModel?> getWalletData() async {
    WalletModel? result;

    final Map<String, String> header = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${authenticationRepo.token}",
    };

    http.Response response = await http.get(
      Uri.parse(ApiEndpoints.getWallet),
      headers: header,
    );

    log(response.body);

    if (response.statusCode >= 500) {
      throw 'Unable to connect to server! \nSomething went wrong.';
    }

    final Map<String, dynamic> responseData = json.decode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      if (responseData['status'] == 'success') {
        result = WalletModel.fromMap(responseData['data']);
      } else {
        throw responseData['msg'];
      }
    } else {
      throw responseData['msg'];
    }

    return result;
  }
}
