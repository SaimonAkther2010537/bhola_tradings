import 'package:flutter/material.dart';

import '../theme/text_config.dart';

class CustomColumnText extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;

  const CustomColumnText({
    super.key,
    required this.title,
    required this.value,
    this.titleStyle,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titleStyle ?? AppText().bodyLarge),
        Text(value, style: valueStyle ?? AppText().headerLine3),
      ],
    );
  }
}