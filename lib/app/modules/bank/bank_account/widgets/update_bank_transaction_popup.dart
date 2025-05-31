
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../../core/custom_controllers/date_time_controller.dart';
import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/widgets/buttons/custom_icon_button.dart';
import '../../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../../core/widgets/input_widgets/dateTime_input_field.dart';
import '../../../../core/widgets/input_widgets/drop-down_input_field.dart';
import '../../../../core/widgets/input_widgets/multi_line_input_field.dart';
import '../../../../core/widgets/input_widgets/simple_input_field.dart';

class UpdateBankTransactionPopup extends StatelessWidget {
  const UpdateBankTransactionPopup({super.key});

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
                        "Update Bank Transaction",
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
                    child: DropDownInputField(
                      controller: TextEditingController(),
                      hintText: 'Select Bank',
                      needValidation: true,
                      errorMessage: 'Please Fill Up This Form',
                      fieldTitle: 'Select Bank',
                      needTitle: true,
                      items: ["EBL", "SIBL", "Dhaka Bank", "Uttara Bank"],
                      titleStyle: AppText().bodyMediumBold,
                    ),
                  ),

                  SizedBox(width: 10),

                  Flexible(
                    child: DropDownInputField(
                      controller: TextEditingController(),
                      hintText: 'Account Type',
                      needValidation: true,
                      errorMessage: 'Please Fill Up This Form',
                      fieldTitle: 'Account Type',
                      needTitle: true,
                      items: ["Credit", "Debit"],
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
                      hintText: '12784',
                      errorMessage: 'errorMessage',
                      fieldTitle: 'Total Amount',
                      titleStyle: AppText().bodyMediumBold,
                      needTitle: true,
                      needValidation: false,
                    ),
                  ),

                  SizedBox(width: 10),

                  Flexible(
                    child: SimpleInputField(
                      controller: TextEditingController(),
                      hintText: '222784',
                      errorMessage: 'errorMessage',
                      fieldTitle: 'Due Amount',
                      titleStyle: AppText().bodyMediumBold,
                      needTitle: true,
                      needValidation: false,
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
                      hintText: '184',
                      errorMessage: 'errorMessage',
                      fieldTitle: 'Interest Rate',
                      titleStyle: AppText().bodyMediumBold,
                      needTitle: true,
                      needValidation: false,
                    ),
                  ),

                  SizedBox(width: 10),

                  Flexible(
                    child: DateTimeInputField(
                      controller: TextEditingController(),
                      hintText: '12-09-2024',
                      needValidation: false,
                      errorMessage: '',
                      dateTimeController: DateTimeController(),
                      suffixIcon: RIcon.Calendar,
                      fieldTitle: 'Date',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              MultiLineInputField(
                controller: TextEditingController(),
                hintText: "Current Account",
                fieldTitle: "Note",
                numberOfLines: 3,
                needTitle: true,
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
                        label: 'Update Bank',
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
