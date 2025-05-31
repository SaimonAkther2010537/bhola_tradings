import 'package:flutter/material.dart';

import '../../theme/app_color_config.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final double? iconSize;
  final Color? iconColor;
  final VoidCallback onTap;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.iconSize,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 35,
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: AppColor.primaryBlack,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          child: Icon(
            icon,
            size: iconSize ?? 20,
            color: iconColor ?? AppColor.yellow,
          ),
        ),
      ),
    );
  }
}
