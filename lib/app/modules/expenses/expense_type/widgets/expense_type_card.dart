import 'package:flutter/material.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';

class ExpenseTypeCard extends StatefulWidget {

  final String expenseTypeName;

  const ExpenseTypeCard({super.key, required this.expenseTypeName});

  @override
  State<ExpenseTypeCard> createState() => _ExpenseTypeCardState();
}

class _ExpenseTypeCardState extends State<ExpenseTypeCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Material(
        color: isHovered ? AppColor.yellow.withOpacity(0.8): AppColor.white,
        elevation: 3,
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Product Name
                  Text(
                    widget.expenseTypeName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppText().headerLine7.copyWith(color: isHovered? AppColor.textBlack :AppColor.yellow),
                    textAlign: TextAlign.center,
                  ),

                ],
              ),

              if (isHovered)
                Container(
                  color: AppColor.yellow.withOpacity(0.3), // Light overlay effect
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(

                        icon: const Icon(RIcon.Pen_New_Round, color: Colors.white),
                        onPressed: () {},
                        iconSize: 24,
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        icon: const Icon(RIcon.Trash_Bin_2, color: Colors.white),
                        onPressed: () {},
                        iconSize: 24,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
