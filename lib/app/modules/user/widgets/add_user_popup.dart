import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../core/theme/app_color_config.dart';
import '../../../core/theme/text_config.dart';
import '../../../core/widgets/buttons/custom_icon_button.dart';
import '../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../core/widgets/input_widgets/drop-down_input_field.dart';
import '../../../core/widgets/input_widgets/simple_input_field.dart';

class AddUserPopup extends StatelessWidget {
  const AddUserPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: AppColor.white,
      child: SizedBox(
        width: size.width * 0.4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Add User",
                        style: AppText().headerLine3.copyWith(
                          color: AppColor.yellow,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),

                  CustomIconButton(
                    icon: RIcon.Close_Square,
                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Flexible(
                    child: SimpleInputField(
                      controller: TextEditingController(),
                      hintText: 'Enter User Name',
                      errorMessage: 'errorMessage',
                      fieldTitle: 'User Name',
                      needTitle: true,
                      needValidation: true,
                      titleStyle: AppText().bodyMediumBold,
                    ),
                  ),

                  SizedBox(width: 10),

                  Flexible(
                    child: SimpleInputField(
                      controller: TextEditingController(),
                      hintText: 'Enter User Email',
                      errorMessage: 'errorMessage',
                      fieldTitle: 'User Email',
                      needTitle: true,
                      needValidation: true,
                      titleStyle: AppText().bodyMediumBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Flexible(
                    child: SimpleInputField(
                      controller: TextEditingController(),
                      hintText: 'Enter Password',
                      errorMessage: 'errorMessage',
                      fieldTitle: 'Password',
                      titleStyle: AppText().bodyMediumBold,
                      needTitle: true,
                      needValidation: false,
                    ),
                  ),

                  SizedBox(width: 10),

                  Flexible(
                    child: SimpleInputField(
                      controller: TextEditingController(),
                      hintText: 'Enter Phone Number',
                      errorMessage: 'errorMessage',
                      fieldTitle: 'Phone Number',
                      titleStyle: AppText().bodyMediumBold,
                      needValidation: true,
                      needTitle: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              DropDownInputField(
                controller: TextEditingController(),
                hintText: 'Select',
                needValidation: true,
                errorMessage: 'Please Select User Type',
                fieldTitle: 'User Type',
                needTitle: true,
                items: ["Operator", "Admin", "Super Admin"],
                titleStyle: AppText().bodyMediumBold,

              ),

              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: RoundedActionButton(
                        onClick: () {
                          Get.back();
                        },
                        label: 'Cancel',
                        backgroundColor: Colors.white,
                        forGroundColor: AppColor.primaryBlack,
                        borderRadius: BorderRadius.circular(10),
                        textStyle: AppText().buttonMedium,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: RoundedActionButton(
                        onClick: () {},
                        label: 'Add User',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
