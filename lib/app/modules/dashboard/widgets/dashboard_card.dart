import 'package:flutter/material.dart';

import '../../../core/theme/app_color_config.dart';
import '../../../core/theme/text_config.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String amount;
  final Color color;

  const DashboardCard({
    super.key,
    required this.title,
    required this.icon,
    required this.amount,
    this.color = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: AppColor.white,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: AppText().headerLine7),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: color, size: 25),
                SizedBox(width: 5),
                Text("$amount ৳", style: AppText().headerLine4.copyWith(color: color)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
