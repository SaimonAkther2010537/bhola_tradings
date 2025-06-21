
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

class UpdateAccountPopup extends StatelessWidget {
  const UpdateAccountPopup({super.key});

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
                        "Update Account",
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
                      hintText: 'Select',
                      needValidation: true,
                      errorMessage: 'Please Fill Up This Form',
                      fieldTitle: 'Account Type',
                      needTitle: true,
                      items: ["Debit", "Credit"],
                      titleStyle: AppText().bodyMediumBold,
                    ),
                  ),

                  SizedBox(width: 10),

                  Flexible(
                    child: SimpleInputField(
                      controller: TextEditingController(),
                      hintText: 'Customer name',
                      errorMessage: 'errorMessage',
                      fieldTitle: 'Creditor Name',
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
                      hintText: 'Enter Phone Number',
                      errorMessage: 'errorMessage',
                      fieldTitle: 'Phone',
                      titleStyle: AppText().bodyMediumBold,
                      needTitle: true,
                      needValidation: true,
                    ),
                  ),

                  SizedBox(width: 10),

                  Flexible(
                    child: SimpleInputField(
                      controller: TextEditingController(),
                      hintText: '13233',
                      errorMessage: 'errorMessage',
                      fieldTitle: 'Credit',
                      titleStyle: AppText().bodyMediumBold,
                      needValidation: true,
                      needTitle: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: size.width * 0.38,
                  child: DateTimeInputField(
                    controller: TextEditingController(),
                    hintText: '2022-08-08',
                    needValidation: false,
                    errorMessage: '',
                    dateTimeController: DateTimeController(),
                    fieldTitle: 'Date',
                    suffixIcon: RIcon.Calendar,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              MultiLineInputField(
                controller: TextEditingController(),
                hintText: "Note",
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
                        label: 'Add Entity',
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
