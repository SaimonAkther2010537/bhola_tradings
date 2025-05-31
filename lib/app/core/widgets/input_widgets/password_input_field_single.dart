// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../constant/constant.dart';
import '../../theme/app_color_config.dart';
import '../../theme/text_config.dart';
import '../../utility/validator.dart';

class PasswordInputFieldSingle extends StatefulWidget {
  final TextEditingController password;
  final TextEditingController? passwordMatch;
  final String fieldTitle;
  final String hintText;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final TextInputAction? textInputAction;
  final IconData? prefixIcon;
  final Widget? prefixWidget;

  const PasswordInputFieldSingle({
    super.key,
    required this.password,
    this.prefixIcon,
    required this.fieldTitle,
    required this.hintText,
    this.textInputAction,
    this.backgroundColor,
    this.borderRadius,
    this.prefixWidget, this.passwordMatch,
  });

  @override
  State<PasswordInputFieldSingle> createState() => _PasswordInputFieldSingleState();
}

class _PasswordInputFieldSingleState extends State<PasswordInputFieldSingle> {
  bool hidePassword = true;
  bool hasSomePassword = false;

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
        TextFormField(
          autofocus: false,
          obscureText: hidePassword,
          controller: widget.password,
          style: AppText().bodyLarge,
          onSaved: (value) {
            widget.password.text = value!;
          },
          onChanged: (value) {
            if (widget.password.text.isNotEmpty) {
              setState(() {
                hasSomePassword = true;
              });
            } else {
              setState(() {
                hasSomePassword = false;
              });
            }
          },
          textInputAction: widget.textInputAction ?? TextInputAction.done,
          validator: widget.passwordMatch == null? Validator().validatePassword
              : (value){
            if(widget.passwordMatch!.text.compareTo(widget.password.text) != 0)
            {
              return "Password doesn't match, Please try again";
            }
            return null;
          },
          decoration: InputDecoration(
              focusColor: AppColor.scaffoldColor,
              filled: true,
              fillColor: widget.backgroundColor ?? AppColor.white,
              errorStyle: AppText().bodyMediumBold.copyWith(fontSize: 11, color: AppColor.red),
              prefixIcon: widget.prefixWidget ?? (widget.prefixIcon != null ? Icon(widget.prefixIcon,size: 20,) : null),
              suffixIcon: hasSomePassword
                  ? IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                icon: hidePassword ? const Icon(RIcon.Eye_Closed ) : const Icon(RIcon.Eye,),
              )
                  : null,
              contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
              // label: Get.focusScope !=null &&  Get.focusScope!.hasFocus
              //     ? RichText(
              //     text: TextSpan(children: [
              //       TextSpan(text: widget.fieldTitle, style: AppText().bodyMediumBold.copyWith(color: AppColor.primaryBlack)),
              //       TextSpan(text: "*", style: AppText().bodyLarge.copyWith(color: AppColor.red)),
              //     ]))
              //     : null,
              hintText: widget.hintText,
              hintStyle: AppText().bodyMediumBold.copyWith(color: AppColor.disabled),
              border: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(8), borderSide: BorderSide(width: borderSideWidth, color: AppColor.yellow)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(8), borderSide: BorderSide(width: borderSideWidth, color: AppColor.yellow)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(8), borderSide: BorderSide(width: borderSideWidth, color: AppColor.yellow)),
              errorBorder: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(8), borderSide: BorderSide(width: borderSideWidth, color: AppColor.yellow))),



        ),
      ],
    );
  }
}
