import 'package:flutter/material.dart';
import '../../constant/constant.dart';
import '../../custom_controllers/date_time_controller.dart';
import '../../theme/app_color_config.dart';
import '../../theme/text_config.dart';

class TimeInputField extends StatefulWidget {
  final TextEditingController controller;
  final DateTimeController dateTimeController;
  final String hintText;
  final String? suffixText;
  final bool needValidation;
  final String errorMessage;
  final BorderRadius? borderRadius;
  final TextInputAction? textInputAction;
  final Color? backgroundColor;
  final String fieldTitle;
  final bool? needTitle;
  final Widget? prefixWidget;
  final Icon? suffixIcon;
  final IconData? prefixIcon;
  final TextStyle? textStyle;
  final TimeOfDay? initialTime;
  final Function(TimeOfDay) onTimeSelected;

  const TimeInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.textStyle,
    required this.needValidation,
    required this.errorMessage,
    this.textInputAction,
    required this.dateTimeController,
    this.backgroundColor,
    this.suffixText,
    required this.fieldTitle,
    this.needTitle,
    this.borderRadius,
    this.prefixWidget,
    this.prefixIcon,
    this.suffixIcon,
    this.initialTime,
    required this.onTimeSelected,
  });

  @override
  State<TimeInputField> createState() => _TimeInputFieldState();
}

class _TimeInputFieldState extends State<TimeInputField> {
  TimeOfDay? pickedTime;

  @override
  void initState() {
    super.initState();
    if (widget.initialTime != null) {
      pickedTime = widget.initialTime;
      widget.controller.text = widget.dateTimeController.formatTime(widget.initialTime!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.needTitle ?? true) Text(widget.fieldTitle, style: AppText().headerLine7),
        TextFormField(
          controller: widget.controller,
          style: widget.textStyle ?? AppText().bodyLarge,
          decoration: InputDecoration(
            errorStyle: AppText().bodyLarge.copyWith(fontSize: 11, color: AppColor.red),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: widget.hintText,
            hintStyle: AppText().bodyMediumBold.copyWith(color: AppColor.primaryBlack),
            filled: true,
            fillColor: widget.backgroundColor ?? AppColor.bgLightColor,
            suffixIcon: widget.suffixIcon,
            suffixText: widget.suffixText != null ? widget.suffixText.toString() : "",
            prefixIcon: widget.prefixWidget ?? (widget.prefixIcon != null ? Icon(widget.prefixIcon) : null),
            border: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              borderSide: BorderSide(width: borderSideWidth, color: AppColor.extraBgColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              borderSide: BorderSide(width: borderSideWidth, color: AppColor.extraBgColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              borderSide: BorderSide(width: borderSideWidth, color: AppColor.extraBgColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              borderSide: BorderSide(width: borderSideWidth, color: AppColor.extraBgColor),
            ),
          ),
          readOnly: true,
          onTap: () async {
            pickedTime = await showTimePicker(
              context: context,
              initialTime: pickedTime ?? TimeOfDay.now(),
            );

            if (pickedTime != null) {
              widget.dateTimeController.inputTime(pickedTime!);
              String formattedTime = widget.dateTimeController.formatTime(pickedTime!);
              setState(() {
                widget.controller.text = formattedTime;
              });

              widget.onTimeSelected(pickedTime!);
            } else {
              setState(() {
                widget.controller.text = widget.errorMessage;
              });
            }
          },

          // onTap: () async {
          //   pickedTime = await showTimePicker(
          //     context: context,
          //     initialTime: pickedTime ?? TimeOfDay.now(), // Use the picked time or fallback to current time
          //   );
          //
          //   if (pickedTime != null) {
          //     widget.dateTimeController.inputTime(pickedTime!); // Update controller with time
          //     String formattedTime = widget.dateTimeController.formatTime(pickedTime!);
          //     setState(() {
          //       widget.controller.text = formattedTime;
          //     });
          //   } else {
          //     setState(() {
          //       widget.controller.text = widget.errorMessage;
          //     });
          //   }
          // },
          validator: (value) {
            if (!widget.needValidation) return null;
            if (value == null || value.isEmpty) {
              return widget.errorMessage;
            }
            return null;
          },
        ),
      ],
    );
  }
}
