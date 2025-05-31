import 'package:flutter/material.dart';

import '../../theme/app_color_config.dart';
import '../../theme/text_config.dart';

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color iconColor;
  final Color labelTextColor;
  final TextStyle? labelTextStyle;
  final Function onClick;
  final double? iconSize;
  final double? padding;
  final double? height;


  const IconTextButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onClick,
    this.backgroundColor = AppColor.primaryBlack,
    this.iconColor = AppColor.yellow,
    this.labelTextColor = AppColor.yellow,
    this.labelTextStyle, this.iconSize, this.padding, this.height,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:height?? 44,
      child: Material(

        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: (){
            onClick();
          },
          child: Padding(
            padding:  EdgeInsets.all(padding?? 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: iconColor, size: iconSize ?? 24),
                SizedBox(width: 4),
                Text(
                  label,
                  style: labelTextStyle ??
                      AppText().buttonSecondary.copyWith(color: labelTextColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
