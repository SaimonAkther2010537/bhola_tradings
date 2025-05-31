import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../theme/app_color_config.dart';
import '../../theme/text_config.dart';
import '../../utility/validator.dart';

class MultiLineInputField extends StatefulWidget {
  final TextEditingController controller;
  final String fieldTitle;
  final String hintText;
  final String? suffixText;
  final int numberOfLines;
  final Color? backgroundColor;
  final bool? viewOnly;
  final bool? needValidation;
  final bool? needTitle;
  final BorderRadius? borderRadius;
  final FormFieldValidator<String>? validatorClass;

  const MultiLineInputField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.needValidation = false,
      this.suffixText,
      this.backgroundColor,
      this.viewOnly,
      required this.fieldTitle,
      this.validatorClass,
      this.needTitle,
      required this.numberOfLines,
      this.borderRadius});

  @override
  State<MultiLineInputField> createState() => _MultiLineInputFieldState();
}

class _MultiLineInputFieldState extends State<MultiLineInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.needTitle ?? true)
          Wrap(
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: widget.fieldTitle, style: AppText().bodyMediumBold),
                  if (widget.needValidation!) TextSpan(text: "*", style: AppText().bodyMediumBold.copyWith(color: AppColor.red))
                ]),
              ),
            ],
          ),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.multiline,
          style:  AppText().bodyMediumBold,
          readOnly: widget.viewOnly ?? false,
          maxLines: widget.numberOfLines,
          decoration: InputDecoration(
              errorStyle: AppText().bodyLarge.copyWith(fontSize: 11, color: AppColor.red),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignLabelWithHint: true,
              // label: RichText(
              //     text: TextSpan(children: [
              //       TextSpan(text: widget.fieldTitle, style: AppText().bodyLarge),
              //       if (widget.validatorClass != null) TextSpan(text: "*", style: AppText().bodyLarge.copyWith(color: AppColor.red)),
              //     ])),
              hintText: widget.hintText,
              hintStyle: AppText().bodyMediumBold.copyWith(color: AppColor.primaryBlack),
              filled: true,
              fillColor: widget.backgroundColor ?? AppColor.white,
              suffixText: widget.suffixText != null ? widget.suffixText.toString() : "",
              suffixIcon: null,
              border: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(8), borderSide: BorderSide(width: borderSideWidth, color: AppColor.yellow)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(8), borderSide: BorderSide(width: borderSideWidth, color: AppColor.blue)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(8), borderSide: BorderSide(width: borderSideWidth, color: AppColor.yellow,)),
              errorBorder: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(8), borderSide: BorderSide(width: borderSideWidth, color: AppColor.yellow))),
          textInputAction: TextInputAction.newline,
          onFieldSubmitted: (value) {
            widget.controller.text = value;
          },
          onSaved: (value) {
            widget.controller.text = value!;
          },
          validator: widget.validatorClass ?? Validator().noValidationRequired,
        ),
      ],
    );
  }
}
