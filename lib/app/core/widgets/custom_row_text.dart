import 'package:flutter/material.dart';
import '../theme/app_color_config.dart';
import '../theme/text_config.dart';

class CustomRowText extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Color? titleColor;
  final Color? subTitleColor;
  final double? titleSize;
  final double? subTitleSize;
  final TextAlign? titleAlign;
  final TextAlign? subTitleAlign;
  final bool? isTitleBold;
  final bool? isSubTitleBold;
  final TextStyle? textStyle;

  const CustomRowText({
    super.key,
    this.title,
    this.subTitle,
    this.titleColor,
    this.subTitleColor,
    this.titleSize,
    this.subTitleSize,
    this.titleAlign,
    this.subTitleAlign,
    this.isTitleBold,
    this.isSubTitleBold,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? '',
          style: (textStyle ?? AppText().headerLine3).copyWith(
            fontSize: titleSize ?? 15.0,
            fontWeight: isTitleBold == true ? FontWeight.w900 : FontWeight.w100,
            color: titleColor ?? AppColor.textBlack,
          ),
        ),
        Text(
          subTitle ?? '',
          style: (textStyle ?? AppText().headerLine3).copyWith(
            fontSize: subTitleSize ?? 15.0,
            fontWeight: isSubTitleBold == true ? FontWeight.w900 : FontWeight.w100,
            color: subTitleColor ?? AppColor.yellow,
          ),
        ),
      ],
    );
  }
}
