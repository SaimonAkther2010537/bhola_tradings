import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import '../../../../core/custom_controllers/date_time_controller.dart';
import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/widgets/buttons/custom_icon_button.dart';
import '../../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../../core/widgets/custom_column_text.dart';
import '../../../../core/widgets/input_widgets/dateTime_input_field.dart';
import '../../../../core/widgets/input_widgets/multi_line_input_field.dart';
import '../../../../core/widgets/input_widgets/simple_input_field.dart';

class DuePaymentPopup extends StatelessWidget {
  const DuePaymentPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: AppColor.white,
      child: SizedBox(
        width: size.width * 0.55,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Selected Sale Transaction Information ",
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

              SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomColumnText(
                        title: 'Customer Name',
                        titleStyle: AppText().bodyLarge.copyWith(
                          color: AppColor.primaryBlack,
                        ),
                        value: '24 Akbor Mia',
                        valueStyle: AppText().headerLine4,
                      ),
                      SizedBox(height: 15),
                      CustomColumnText(
                        title: 'Quantity',
                        titleStyle: AppText().bodyLarge.copyWith(
                          color: AppColor.primaryBlack,
                        ),
                        value: '248',
                        valueStyle: AppText().headerLine4,

                      ),
                      SizedBox(height: 15),
                      CustomColumnText(
                        title: 'Paid Amount',
                        titleStyle: AppText().bodyLarge.copyWith(
                          color: AppColor.primaryBlack,
                        ),
                        value: '248,899.000',
                        valueStyle: AppText().headerLine4,

                      ),
                    ]
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomColumnText(
                        title: 'Date ',
                        titleStyle: AppText().bodyLarge.copyWith(
                          color: AppColor.primaryBlack,
                        ),
                        value: '24-03-2024',
                        valueStyle: AppText().headerLine4,

                      ),
                      SizedBox(height: 15),
                      CustomColumnText(
                        title: 'Unit Price ',
                        titleStyle: AppText().bodyLarge.copyWith(
                          color: AppColor.primaryBlack,
                        ),
                        value: '45',
                        valueStyle: AppText().headerLine4,

                      ),
                      SizedBox(height: 15),
                      CustomColumnText(
                        title: 'Due Amount ',
                        titleStyle: AppText().bodyLarge.copyWith(
                          color: AppColor.primaryBlack,
                        ),
                        value: '45,900.000',
                        valueStyle: AppText().headerLine4,

                      )

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomColumnText(
                        title: 'Rice Name',
                        titleStyle: AppText().bodyLarge.copyWith(
                          color: AppColor.primaryBlack,
                        ),
                        value: 'Dhaner shis (Saleha Auto)',
                        valueStyle: AppText().headerLine4,

                      ),
                      SizedBox(height: 15),
                      CustomColumnText(
                        title: 'Total Price',
                        titleStyle: AppText().bodyLarge.copyWith(
                          color: AppColor.primaryBlack,
                        ),
                        value: '21,478.000',
                        valueStyle: AppText().headerLine4,

                      ),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(
                    child: SimpleInputField(
                      controller: TextEditingController(),
                      hintText: 'Enter name',
                      errorMessage: 'errorMessage',
                      fieldTitle: 'Pay Amount',
                      titleStyle: AppText().bodyMediumBold,
                      needValidation: true,
                      needTitle: true,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: DateTimeInputField(
                      controller: TextEditingController(),
                      hintText: '',
                      needValidation: false,
                      errorMessage: '',
                      dateTimeController: DateTimeController(),
                      fieldTitle: 'Date',
                      needTitle: true,
                      suffixIcon: RIcon.Calendar,

                    ),
                  ),
                ],
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
                        label: 'Update',
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
