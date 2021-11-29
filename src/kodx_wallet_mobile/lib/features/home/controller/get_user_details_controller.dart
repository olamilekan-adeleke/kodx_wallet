import 'package:get/get.dart';
import 'package:kodx_wallet_mobile/cores/utils/emums.dart';
import 'package:kodx_wallet_mobile/features/auth/model/user_details_model.dart';

class GetUserDetailsController extends GetxController {
  final Rx<ControllerState> controllerState = ControllerState.init.obs;
  Rx<UserDetailsModel>? userDetails;

  void getUserData() {
    
  }

  @override
  void onReady() {
    getUserData();
    super.onReady();
  }
}
