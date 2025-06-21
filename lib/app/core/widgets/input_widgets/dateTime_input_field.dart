// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../custom_controllers/date_time_controller.dart';
import '../../theme/app_color_config.dart';
import '../../theme/text_config.dart';

class DateTimeInputField extends StatefulWidget {
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
  final IconData? suffixIcon;
  final IconData? prefixIcon;

  const DateTimeInputField(
      {super.key,
        required this.controller,
        required this.hintText,
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
        this.suffixIcon});

  @override
  State<DateTimeInputField> createState() => _DateTimeInputFieldState();
}

class _DateTimeInputFieldState extends State<DateTimeInputField> {
  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.needTitle ?? true) Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(widget.fieldTitle, style: AppText().bodyMediumBold),
        ),
        if (widget.needTitle ?? true)
          TextFormField(
            controller: widget.controller,
            style: AppText().bodyLarge,
            decoration: InputDecoration(
                errorStyle: AppText().bodyLarge.copyWith(fontSize: 11, color: AppColor.red),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                hintText: widget.hintText,
                hintStyle: AppText().bodyMediumBold.copyWith(color: AppColor.disabled),
                // label: Get.focusScope !=null && Get.focusScope!.hasFocus
                //     ? RichText(
                //     text: TextSpan(
                //         children:
                //         [
                //           TextSpan(text:widget.fieldTitle,style: AppText().bodyLarge.copyWith(color: AppColor.primaryBlack)),
                //           if(widget.needValidation)
                //             TextSpan(text:"*",style: AppText().bodyLarge.copyWith(color: AppColor.red)),
                //         ]
                //     )) : null,
                filled: true,
                fillColor: widget.backgroundColor ?? AppColor.bgLightColor,
                suffixIcon: widget.suffixIcon != null ? Icon(widget.suffixIcon) : null,
                suffixText: widget.suffixText != null ? widget.suffixText.toString() : "",
                prefixIcon: widget.prefixWidget ?? (widget.prefixIcon != null ? Icon(widget.prefixIcon) : null),
                border: OutlineInputBorder(
                    borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
                    borderSide: BorderSide(width: borderSideWidth, color: AppColor.yellow)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
                    borderSide: BorderSide(width: borderSideWidth, color: AppColor.blue)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
                    borderSide: BorderSide(width: borderSideWidth, color: AppColor.yellow)),
                errorBorder: OutlineInputBorder(
                    borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
                    borderSide: BorderSide(width: borderSideWidth, color: AppColor.yellow))),
            readOnly: true,
            onTap: () async {
              pickedDate = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
                // currentTime: DateTime.now(),
                initialDate: DateTime.now(),
              );

              if (pickedDate != null) {
                widget.dateTimeController.inputDateTime(pickedDate!);
                String formattedDate = widget.dateTimeController.getDateMonthYear();
                setState(() {
                  widget.controller.text = formattedDate;
                });
              } else {
                setState(() {
                  widget.controller.text = widget.errorMessage;
                });
              }
            },
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
