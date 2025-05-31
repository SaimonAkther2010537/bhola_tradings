
import 'package:flutter/material.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../core/utility/validator.dart';
import '../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../core/widgets/input_widgets/password_input_field_single.dart';
import '../../../core/widgets/input_widgets/simple_input_field.dart';
import '../controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  final LoginController controller;

  const LoginForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SimpleInputField(
            prefixIcon: RIcon.Letter,
            controller: controller.emailController,
            hintText: 'Email',
            errorMessage: 'Field Required',
            fieldTitle: 'Email',
            needTitle: false,
            needValidation: true,
            validatorClass: Validator().validateEmail,
          ),
          const SizedBox(height: 10),

          PasswordInputFieldSingle(
            password: controller.passwordController,
            hintText: 'Password',
            fieldTitle: '',
            prefixIcon: RIcon.Lock,
            // suffixIcon: RIcon.Eye,
          ),
          const SizedBox(height: 30),
          RoundedActionButton(
            onClick: () {
              if (controller.loginKey.currentState!.validate()) {
                controller.userLogin(context);
              }
            },
            label: "Login",
          ),
        ],
      ),
    );
  }
}
