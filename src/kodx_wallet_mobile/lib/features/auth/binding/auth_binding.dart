import '../../../features/auth/controllers/forgot_password_controller.dart';
import '../../../features/auth/controllers/login_controller.dart';
import '../../../features/auth/controllers/register_controller.dart';
import '../../../features/auth/services/auth_services.dart';
import 'package:get/instance_manager.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthenticationRepo>(AuthenticationRepo());
    Get.put<RegisterController>(RegisterController());
    Get.put<LoginControllers>(LoginControllers());
    Get.put<ForgotPasswordController>(ForgotPasswordController());
  }
}
