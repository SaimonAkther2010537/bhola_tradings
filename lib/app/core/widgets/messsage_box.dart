import 'package:flutter/cupertino.dart';

import '../theme/text_config.dart';

class MessageBox extends StatelessWidget {
  final String? message;
  final double? height;

  const MessageBox({super.key, this.message, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ??  150,
      child: Center(
        child: Text(message ?? "Please try again later", style: AppText().bodySmall, textAlign: TextAlign.center),
      ),
    );
  }
}
