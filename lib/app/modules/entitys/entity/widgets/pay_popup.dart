
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../../core/custom_controllers/date_time_controller.dart';
import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/widgets/buttons/custom_icon_button.dart';
import '../../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../../core/widgets/input_widgets/dateTime_input_field.dart';
import '../../../../core/widgets/input_widgets/multi_line_input_field.dart';
import '../../../../core/widgets/input_widgets/simple_input_field.dart';

class PayPopup extends StatelessWidget {
  const PayPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: AppColor.white,
      child: SizedBox(
        width: size.width * 0.30,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Advance Pay ",
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
              SimpleInputField(
                controller: TextEditingController(),
                hintText: 'Enter name',
                errorMessage: 'errorMessage',
                fieldTitle: 'Advance Pay Amount ',
                titleStyle: AppText().bodyMediumBold,
                needTitle: true,
                needValidation: true,
              ),
              const SizedBox(height: 10),
              DateTimeInputField(
                controller: TextEditingController(),
                hintText: '',
                needValidation: true,
                errorMessage: 'Select a Date',
                dateTimeController: DateTimeController(),
                fieldTitle: 'Date',
                needTitle: true,
                suffixIcon: RIcon.Calendar,
              ),

              const SizedBox(height: 10),

              MultiLineInputField(
                controller: TextEditingController(),
                hintText: "",
                fieldTitle: "Note",
                numberOfLines: 3,
                needTitle: true,
              ),

              const SizedBox(height: 30),
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
                        label: 'Submit',
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
