import 'package:get/get.dart';
import 'package:kodx_wallet_mobile/features/home/controller/get_user_details_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<GetUserDetailsController>(GetUserDetailsController());
  }
}
