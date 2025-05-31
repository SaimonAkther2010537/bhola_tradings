import 'package:bhola_tradings/app/core/widgets/buttons/rouded_action_button.dart';
import 'package:flutter/material.dart';

import '../../theme/app_color_config.dart';
import '../../theme/text_config.dart';

class CouponButton extends StatelessWidget {
  final String hintText;
  final String label;
  final TextStyle? hintStyle;
  final Color? buttonBackgroundColor;
  final VoidCallback onClick;

  const CouponButton({
    super.key,
    required this.hintText,
    required this.label,
    required this.onClick,
    this.hintStyle,
    this.buttonBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(color: AppColor.extraBgColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: hintStyle ?? AppText().bodyExtraMedium,
                    border: const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              Flexible(
                flex: 0,
                child: SizedBox(
                  width: 91,
                  child: RoundedActionButton(
                    onClick: onClick,
                    label: label,
                    backgroundColor: buttonBackgroundColor ?? AppColor.primaryGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
