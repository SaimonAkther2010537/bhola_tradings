import 'package:flutter/material.dart';

import '../../theme/app_color_config.dart';
import '../../theme/text_config.dart';

class NavigationButton extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final Color? bgColor;
  final Color? textColor;
  final Color? iconColor;
  final EdgeInsets? padding;
  final VoidCallback onTap;
  final IconData? icon;

  const NavigationButton({
    super.key,
    required this.label,
    this.labelColor,
    this.bgColor,
    this.textColor,
    this.iconColor,
    this.padding,
    required this.onTap, this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor ?? AppColor.primaryBlack,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Would you like to \n',
                  style: AppText()
                      .bodyMedium
                      .copyWith(color: textColor ?? AppColor.white),
                  children: [
                    TextSpan(
                        text: label,
                        style: AppText().headerLine7.copyWith(
                            color: labelColor ?? AppColor.white,
                            decoration: TextDecoration.underline,
                            decorationColor: labelColor ?? AppColor.white)),
                  ],
                ),
              ),
              Icon(
                icon ?? Icons.arrow_forward,
                color: iconColor ?? AppColor.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
