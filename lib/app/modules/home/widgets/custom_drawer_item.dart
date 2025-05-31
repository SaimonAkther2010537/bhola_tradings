import 'package:flutter/material.dart';

import '../../../core/theme/app_color_config.dart';

class CustomDrawerItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;

  const CustomDrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  @override
  _CustomDrawerItemState createState() => _CustomDrawerItemState();
}

class _CustomDrawerItemState extends State<CustomDrawerItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          color:
              widget.isSelected
                  ? AppColor.white
                  : isHovered
                  ? AppColor.white.withOpacity(0.7)
                  : Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Icon(
                  widget.icon,
                  size: 20,
                  color:
                      widget.isSelected
                          ? AppColor.yellow
                          : isHovered
                          ? AppColor.yellow
                          : AppColor.white,
                ),
              ),
              // SizedBox(width: 6),
              Expanded(
                flex: 3,
                child: Text(
                  widget.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color:
                        widget.isSelected
                            ? AppColor.yellow
                            : isHovered
                            ? AppColor.yellow
                            : AppColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(
                      turns: Tween(begin: 0.5, end: 1.0).animate(animation),
                      // Flip effect
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                  child: Icon(
                    widget.isSelected
                        ? Icons.arrow_back_ios
                        : Icons.arrow_forward_ios,
                    key: ValueKey(widget.isSelected),
                    // Ensures smooth transition
                    size: 16,
                    color:
                        widget.isSelected
                            ? AppColor.yellow
                            : isHovered
                            ? AppColor.yellow
                            : AppColor.white,
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
