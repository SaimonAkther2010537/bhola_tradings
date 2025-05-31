import 'package:flutter/material.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../theme/app_color_config.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onTap;

  const CustomBackButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        iconSize: 18,
        padding: EdgeInsets.zero,
        fixedSize: const Size(32, 32),
        maximumSize: const Size(32, 32),
        minimumSize: const Size(32, 32),
        backgroundColor: AppColor.bgLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      onPressed: onTap,
      icon: Icon(
        RIcon.Arrow_Left,
        color: AppColor.primaryBlack,
      ),
    );
  }
}
