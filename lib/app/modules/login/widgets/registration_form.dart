
import 'package:flutter/material.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../core/constant/custom_snackbar.dart';
import '../../../core/utility/validator.dart';
import '../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../core/widgets/input_widgets/drop-down_input_field.dart';
import '../../../core/widgets/input_widgets/password_input_field_single.dart';
import '../../../core/widgets/input_widgets/simple_input_field.dart';
import '../controllers/login_controller.dart';

class RegistrationForm extends StatelessWidget {
  final LoginController controller;

  const RegistrationForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.registrationKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SimpleInputField(
            prefixIcon: RIcon.User,
            controller: controller.regNameController,
            hintText: 'Full Name',
            errorMessage: 'Field Required',
            fieldTitle: 'Name',
            needTitle: false,
            validatorClass: Validator().validateName,
          ),
          const SizedBox(height: 10),
          SimpleInputField(
            prefixIcon: RIcon.Letter,
            controller: controller.regEmailController,
            hintText: 'Email',
            errorMessage: 'Field Required',
            fieldTitle: 'Email',
            needTitle: false,
            validatorClass: Validator().validateEmail,
          ),
          const SizedBox(height: 10),
          PasswordInputFieldSingle(
            password: controller.regPasswordController,
            hintText: 'Password',
            fieldTitle: '',
            prefixIcon: RIcon.Lock,
          ),
          const SizedBox(height: 10),
          PasswordInputFieldSingle(
            password: controller.regConfirmPasswordController,
            hintText: 'Confirm-Password',
            fieldTitle: '',
            prefixIcon: RIcon.Lock,
          ),
          const SizedBox(height: 10),
          SimpleInputField(
            prefixIcon: RIcon.Phone_,
            controller: controller.phoneNumberController,
            hintText: 'Phone Number',
            errorMessage: 'Field Required',
            fieldTitle: 'Phone ',
            needTitle: false,
            validatorClass: Validator().validateBangladeshNumber,
          ),
          const SizedBox(height: 10),
          DropDownInputField(
            prefixIcon: RIcon.User,
            controller: controller.userTypeController,
            hintText: 'User type',
            errorMessage: 'Field Required',
            fieldTitle: 'User Type',
            needTitle: false,
            needValidation: false,
            items: ["user", "admin"],
          ),
          const SizedBox(height: 30),
          RoundedActionButton(
            onClick: () {
              if (controller.registrationKey.currentState!.validate()) {
                final password = controller.regPasswordController.text.trim();
                final confirmPassword = controller.regConfirmPasswordController.text.trim();

                if (password != confirmPassword) {
                  CustomSnackBar.showCustomErrorToast(
                    title: "Alert",
                    message: 'Password and confirm password not matched!',
                  );
                  return;
                }
                controller.userRegister(context: context);
              }
            },
            label: "Register",
          ),
        ],
      ),
    );
  }
}

