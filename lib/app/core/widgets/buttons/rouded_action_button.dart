
import 'package:flutter/material.dart';

import '../../theme/app_color_config.dart';
import '../../theme/text_config.dart';

class RoundedActionButton extends StatefulWidget {
  final Function onClick;
  final String label;
  final Color? forGroundColor;
  final double? height;
  final double? width;
  final double? radius;
  final bool? isFilled;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final double? fontSize;
  final TextStyle? textStyle;

  const RoundedActionButton(
      {super.key,
        required this.onClick,
        required this.label,
        this.forGroundColor,
        this.backgroundColor,
        this.height,
        this.width,
        this.fontSize,
        this.radius,
        this.borderRadius,
        this.textStyle,
        this.isFilled,
        this.padding});

  @override
  State<RoundedActionButton> createState() => _RoundedActionButtonState();
}

class _RoundedActionButtonState extends State<RoundedActionButton> {
  bool showFilledButton = true;

  @override
  void initState() {
    showFilledButton = widget.isFilled ?? true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: Material(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(widget.radius ?? 10),
        clipBehavior: Clip.hardEdge,
        color: showFilledButton ? widget.backgroundColor ?? AppColor.yellow : widget.backgroundColor ?? AppColor.yellow,
        child: InkWell(
          onTap: () {
            widget.onClick();
          },
          child: Container(
            // height: widget.height ?? 45,
            // width: widget.width ?? 120,
            padding: widget.padding ?? const EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(widget.radius ?? 6),
              border: showFilledButton
                  ? Border.all(
                width: 1,
                color: widget.forGroundColor ?? Colors.transparent,
              )
                  : Border.all(
                width: 0.5,
                color: Colors.transparent,
              ),
            ),
            child: Center(
              child: Text(
                widget.label,
                textAlign: TextAlign.center,
                style: widget.textStyle ??
                    AppText().buttonLarge.copyWith(
                      color: widget.forGroundColor ?? AppColor.white,
                      fontSize: widget.fontSize ?? 14,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
