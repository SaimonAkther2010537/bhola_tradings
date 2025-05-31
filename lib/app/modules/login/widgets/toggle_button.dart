import 'package:flutter/material.dart';

import '../../../core/theme/app_color_config.dart';
import '../controllers/login_controller.dart';

class ToggleButton extends StatelessWidget {
  final LoginController controller;
  final String label;
  final bool isLoginButton;
  const ToggleButton({super.key, required this.controller, required this.label, required this.isLoginButton});

  @override
  Widget build(BuildContext context) {

    final isSelected = isLoginButton == controller.isLogin.value;

    return  Material(
      borderRadius: BorderRadius.circular(10),
      color: isSelected ? AppColor.yellow : AppColor.yellow.withOpacity(0.3),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          controller.isLogin.value = isLoginButton;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? AppColor.white : AppColor.primaryBlack,
              fontWeight: FontWeight.bold,
              fontSize: 13
            ),
          ),
        ),
      ),
    );
  }
}
