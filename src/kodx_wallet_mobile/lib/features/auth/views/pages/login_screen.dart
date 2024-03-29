import '../../../../cores/constants/color.dart';

import '../../../../cores/components/custom_button.dart';
import '../../../../cores/components/custom_scaffold_widget.dart';
import '../../../../cores/components/custom_text_widget.dart';
import '../../../../cores/components/custom_textfiled.dart';
import '../../../../cores/utils/emums.dart';
import '../../../../cores/utils/navigator_service.dart';
import '../../../../cores/utils/route_name.dart';
import '../../../../cores/utils/custom_sizer_utils.dart';
import '../../../../cores/utils/validator.dart';
import '../../../../features/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static final LoginControllers loginControllers = Get.find<LoginControllers>();

  @override
  Widget build(BuildContext context) {
    return scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: sizerSp(20)),
            textWidget(
              'Welcome! \nLogin Now',
              fontWeight: FontWeight.w700,
              size: sizerSp(30),
            ),
            SizedBox(height: sizerSp(30)),
            Center(
              child: SvgPicture.asset(
                'assets/images/signup.svg',
                height: sizerSp(100),
                width: sizerSp(150),
              ),
            ),
            SizedBox(height: sizerSp(40)),
            KodTextField(
              hintText: 'john.smith@gmail.com',
              labelText: 'Email',
              textEditingController: loginControllers.emailController,
              textInputType: TextInputType.emailAddress,
              validator: (String? value) =>
                  formFieldValidator(value, 'email', 3),
            ),
            SizedBox(height: sizerSp(10)),
            KodTextField(
              hintText: 'xxxxxxxx',
              labelText: 'Password',
              isPassword: true,
              textEditingController: loginControllers.passwordController,
              validator: (String? value) =>
                  formFieldValidator(value, 'password', 6),
            ),
            SizedBox(height: sizerSp(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () =>
                      NavigationService.navigateTo(RouteName.forgotPassword),
                  child: textWidget(
                    'Forgot Password?',
                    fontWeight: FontWeight.w500,
                    size: sizerSp(12),
                    color: kcPrimaryColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: sizerSp(60)),
            Obx(() {
              if (loginControllers.controllerStateEnum ==
                  ControllerState.busy) {
                return const CustomButton.loading();
              }
              return CustomButton(
                text: 'Login',
                onTap: () => loginControllers.loginUser(),
              );
            }),
            SizedBox(height: sizerSp(20)),
            GestureDetector(
              onTap: () => NavigationService.navigateTo(RouteName.signup),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  textWidget(
                    'Are you new here? ',
                    fontWeight: FontWeight.w400,
                    size: sizerSp(13),
                  ),
                  textWidget(
                    'Create Account',
                    fontWeight: FontWeight.w700,
                    size: sizerSp(13),
                    color: kcPrimaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
