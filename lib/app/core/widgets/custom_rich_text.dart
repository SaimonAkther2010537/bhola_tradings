import 'package:flutter/material.dart';

import '../theme/app_color_config.dart';
import '../theme/text_config.dart';


class CustomRichText extends StatelessWidget {
  final String amount;

  const CustomRichText({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Total: ',
        style: AppText().buttonLarge.copyWith(
          color: AppColor.yellow,
        ),
        children: [
          TextSpan(
            text: '$amount ',
            style: AppText().headerLine7.copyWith(
              color: AppColor.yellow,
            ),
          ),
          TextSpan(
            text: 'KG',
            style: AppText().bodyMediumBold.copyWith(
              color: AppColor.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
