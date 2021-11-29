import '../../../../cores/constants/color.dart';

import '../../../../cores/components/custom_button.dart';
import '../../../../cores/components/custom_scaffold_widget.dart';
import '../../../../cores/components/custom_text_widget.dart';
import '../../../../cores/components/custom_textfiled.dart';
import '../../../../cores/utils/emums.dart';
import '../../../../cores/utils/navigator_service.dart';
import '../../../../cores/utils/custom_sizer_utils.dart';
import '../../../../cores/utils/validator.dart';
import '../../../../features/auth/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static final RegisterController registerController =
      Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: sizerSp(10)),
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
            'Create \nAccount',
            fontWeight: FontWeight.w700,
            size: sizerSp(30),
          ),
          SizedBox(height: sizerSp(30)),
          KodTextField(
            hintText: 'john smith',
            labelText: 'FullName',
            textEditingController: registerController.fullNameController,
            validator: (String? value) =>
                formFieldValidator(value, 'First Name', 3),
          ),
          SizedBox(height: sizerSp(10)),
          KodTextField(
            hintText: 'john.smith@gmail.com',
            labelText: 'Email',
            textEditingController: registerController.emailController,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: sizerSp(10)),
          KodTextField(
            hintText: '@kod-x',
            labelText: 'Username',
            textEditingController: registerController.emailController,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: sizerSp(10)),
          KodTextField(
            hintText: '08011223678',
            labelText: 'Phone number',
            textEditingController: registerController.phoneController,
            textInputType: TextInputType.number,
            validator: (String? value) =>
                formFieldValidator(value, 'number', 10),
          ),
          SizedBox(height: sizerSp(10)),
          KodTextField(
            hintText: 'xxxxxxxxxx',
            labelText: 'Password',
            textEditingController: registerController.passwordController,
            isPassword: true,
            validator: (String? value) =>
                formFieldValidator(value, 'password', 6),
          ),
          SizedBox(height: sizerSp(40)),
          Obx(() {
            if (registerController.controllerStateEnum ==
                ControllerState.busy) {
              return const CustomButton.loading();
            }

            return CustomButton(
              text: 'Create account',
              onTap: () => registerController.registerUser(),
            );
          }),
          SizedBox(height: sizerSp(20)),
          GestureDetector(
            onTap: () => NavigationService.goBack(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                textWidget(
                  'Already have an account? ',
                  fontWeight: FontWeight.w400,
                  size: sizerSp(13),
                ),
                textWidget(
                  'Login',
                  fontWeight: FontWeight.w700,
                  size: sizerSp(13),
                  color: kcPrimaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
