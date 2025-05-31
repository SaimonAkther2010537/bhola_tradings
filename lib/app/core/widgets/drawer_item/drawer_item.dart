import 'package:flutter/material.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../theme/app_color_config.dart';
import '../../theme/text_config.dart';
import '../buttons/rouded_action_button.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool? showIcon;
  final Color? color;
  final Color? bgColor;

  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.showIcon = false,
    this.color, this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: bgColor ?? Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 18,
                      color:  color ?? AppColor.primaryBlack,
                    ),
                    const SizedBox(width: 10),
                    Text(title, style: AppText().headerLine6.copyWith(color: color ?? AppColor.primaryBlack))
                  ],
                ),
              ),

              if (showIcon == true) Icon(RIcon.Alt_Arrow_Right, size: 22,color: color ?? AppColor.primaryBlack)

              // Icon(Icons.add),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem2 extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool? showIcon;

  const DrawerItem2({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.showIcon = false,
  });

  @override
  State<DrawerItem2> createState() => _DrawerItem2State();
}

class _DrawerItem2State extends State<DrawerItem2> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          widget.icon,
                          size: 18,
                        ),
                        const SizedBox(width: 10),
                        Text(widget.title, style: AppText().headerLine6)
                      ],
                    ),
                  ),

                  Material(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.scaffoldColor,
                      child: SizedBox(
                        width: 35,
                        height: 35,
                        child: IconButton(
                          color: AppColor.primaryBlack,
                          icon: Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up_outlined
                                : Icons.keyboard_arrow_down,
                            size: 18,
                          ),
                          onPressed: () {
                            // Perform some action when the button is pressed
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                        ),
                      ))

                  // Icon(Icons.add),
                ],
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: isExpanded ? (2 * 50) : 0, // child height; 160
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Visibility(
                  visible: isExpanded,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("English", style: AppText().bodyMediumBold),
                            RoundedActionButton(
                              onClick: () {},
                              label: "Active",
                              textStyle: AppText()
                                  .bodySmall
                                  .copyWith(color: Colors.white),
                              backgroundColor: AppColor.primaryGreen,
                              borderRadius: BorderRadius.circular(10),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Arabic", style: AppText().bodyMediumBold),
                            RoundedActionButton(
                              onClick: () {},
                              label: "Active",
                              textStyle: AppText()
                                  .bodySmall
                                  .copyWith(color: Colors.white),
                              backgroundColor: AppColor.primaryGreen,
                              borderRadius: BorderRadius.circular(10),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  // child: ListView.builder(
                  //   padding: const EdgeInsets.only(top: 10),
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: 2,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return Padding(
                  //       padding: const EdgeInsets.only(bottom: 10),
                  //       child: Container(
                  //         height: 40,
                  //         color: Colors.red.withOpacity(index.toDouble()/2+0.03),
                  //       ),
                  //     );
                  //   },
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
