import '../../../../cores/components/custom_scaffold_widget.dart';
import '../../../../cores/constants/color.dart';
import '../../../../cores/utils/navigator_service.dart';

import '../../../../cores/components/custom_button.dart';
import '../../../../cores/components/custom_text_widget.dart';
import '../../../../cores/components/custom_textfiled.dart';
import '../../../../cores/utils/emums.dart';
import '../../../../cores/utils/custom_sizer_utils.dart';
import '../../../../features/auth/controllers/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen();

  static final ForgotPasswordController forgotPasswordController =
      Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: sizerSp(20)),
            GestureDetector(
              onTap: () => NavigationService.goBack(),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: sizerSp(35),
                  width: sizerSp(35),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kcPrimaryColor.withOpacity(0.1),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    size: sizerSp(16),
                    color: kcPrimaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: sizerSp(20)),
            textWidget(
              'Reset Password',
              fontWeight: FontWeight.w700,
              size: sizerSp(30),
            ),
            textWidget(
              'Did You Forgot Your Password?\nEnter Your Email Below,'
              ' A Link Will Be Sent To That Email',
              fontWeight: FontWeight.w400,
              size: sizerSp(12),
            ),
            SizedBox(height: sizerSp(60)),
            Center(
              child: SvgPicture.asset(
                'assets/images/forgot_password.svg',
                height: sizerSp(100),
                width: sizerSp(150),
              ),
            ),
            SizedBox(height: sizerSp(30)),
            KodTextField(
              hintText: 'john.smith@gmail.com',
              labelText: 'Email',
              textEditingController: forgotPasswordController.emailController,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: sizerSp(80)),
            Obx(() {
              if (forgotPasswordController.controllerStateEnum ==
                  ControllerState.busy) {
                return const CustomButton.loading();
              }

              return CustomButton(
                text: 'Send',
                onTap: () => forgotPasswordController.sendEmail(),
              );
            }),
            SizedBox(height: sizerSp(20)),
          ],
        ),
      ),
    );
  }
}
