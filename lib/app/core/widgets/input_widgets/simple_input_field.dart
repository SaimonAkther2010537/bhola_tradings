import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../../theme/app_color_config.dart';
import '../../theme/text_config.dart';
import '../../utility/validator.dart';

class SimpleInputField extends StatefulWidget {
  final TextEditingController controller;
  final String fieldTitle;
  final String hintText;
  final String errorMessage;
  final BorderRadius? borderRadius;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final String? suffixText;
  final bool? needValidation;

  final Color? backgroundColor;
  final bool? viewOnly;
  final bool? needTitle;
  final bool? needLevel;
  final TextAlign? textAlign;
  final TextStyle? hintTextStyle;
  final TextStyle? inputTextStyle;
  final Key? itemKey;
  final Function? onValueChange;
  final TextStyle? titleStyle;
  final Widget? prefixWidget;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final FormFieldValidator<String>? validatorClass;

  const SimpleInputField({
    super.key,
    this.onValueChange,
    required this.controller,
    required this.hintText,
    required this.errorMessage,
    this.needValidation = false,
    this.needLevel = false,
    this.textInputAction,
    this.inputType,
    this.suffixText,
    this.backgroundColor,
    this.viewOnly,
    required this.fieldTitle,
    this.validatorClass,
    this.needTitle,
    this.textAlign,
    this.prefixIcon,
    this.suffixIcon,
    this.itemKey,
    this.borderRadius,
    this.hintTextStyle,
    this.inputTextStyle,
    this.titleStyle,
    this.prefixWidget,
  });

  @override
  State<SimpleInputField> createState() => _SimpleInputFieldState();
}

class _SimpleInputFieldState extends State<SimpleInputField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.needTitle ?? true && widget.needLevel == false)
          Wrap(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.fieldTitle,
                      style: widget.titleStyle ?? AppText().headerLine7,
                    ),
                    if (widget.needValidation!)
                      TextSpan(
                        text: "*",
                        style: AppText().bodyMediumBold.copyWith(
                          color: AppColor.red,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        if (widget.needTitle ?? true) const SizedBox(height: 6),
        TextFormField(
          key: widget.itemKey,
          controller: widget.controller,
          keyboardType: widget.inputType ?? TextInputType.text,
          style: widget.inputTextStyle ?? AppText().bodyMediumBold,
          textAlign: widget.textAlign ?? TextAlign.start,
          readOnly: widget.viewOnly ?? false,
          enabled: widget.viewOnly != null ? !widget.viewOnly! : true,
          // maxLength: null,
          decoration: InputDecoration(
            // counter:Text(""),
            errorStyle: AppText().bodyLarge.copyWith(
              fontSize: 11,
              color: AppColor.red,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 13,
            ),
            label:
                widget.needLevel == true
                    ? Get.focusScope != null && Get.focusScope!.hasFocus
                        ? RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: widget.fieldTitle,
                                style: AppText().bodyLarge.copyWith(
                                  color: AppColor.primaryBlack,
                                ),
                              ),
                              if (widget.validatorClass != null)
                                TextSpan(
                                  text: "*",
                                  style: AppText().bodyLarge.copyWith(
                                    color: AppColor.red,
                                  ),
                                ),
                            ],
                          ),
                        )
                        : null
                    : null,
            hintText: widget.hintText,
            hintStyle:
                widget.hintTextStyle ??
                AppText().bodyMediumBold.copyWith(color: AppColor.disabled),
            filled: true,
            fillColor: widget.backgroundColor ?? AppColor.white,
            suffixText:
                widget.suffixText != null ? widget.suffixText.toString() : "",
            suffixIcon:
                widget.prefixWidget ??
                (widget.suffixIcon != null ? Icon(widget.suffixIcon,size: 20,) : null),
            prefixIcon:
                widget.prefixWidget ??
                (widget.prefixIcon != null ? Icon(widget.prefixIcon,size: 20,) : null),
            border: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              borderSide: BorderSide(
                width: borderSideWidth,
                color: AppColor.yellow,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              borderSide: BorderSide(
                width: borderSideWidth,
                color: AppColor.blue,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              borderSide: BorderSide(
                width: borderSideWidth,
                color: AppColor.yellow,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              borderSide: BorderSide(
                width: borderSideWidth,
                color: AppColor.yellow,
              ),
            ),
          ),

          textInputAction: widget.textInputAction ?? TextInputAction.next,
          onFieldSubmitted: (value) {
            widget.controller.text = value;
          },
          onSaved: (value) {
            widget.controller.text = value!;
          },
          validator: widget.validatorClass ?? Validator().noValidationRequired,
          onChanged: (value) {
            if (widget.onValueChange != null) {
              widget.onValueChange!(value);
            }
          },
        ),
      ],
    );
  }
}
