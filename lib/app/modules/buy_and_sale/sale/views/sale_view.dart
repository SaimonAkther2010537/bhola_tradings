import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../../core/custom_controllers/date_time_controller.dart';
import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../../core/widgets/input_widgets/dateTime_input_field.dart';
import '../../../../core/widgets/input_widgets/drop-down_input_field.dart';
import '../../../../core/widgets/input_widgets/multi_line_input_field.dart';
import '../../../../core/widgets/input_widgets/simple_input_field.dart';
import '../../buy/controllers/buy_controller.dart';
import '../controllers/sale_controller.dart';

class SaleView extends GetView<SaleController> {
  const SaleView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final buyController = Get.find<BuyController>();
    return Scaffold(
      backgroundColor: AppColor.bgLightColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Card(
                color: AppColor.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// =========================== Heading ====================================
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Sale Transaction",
                                style: AppText().headerLine3.copyWith(
                                  color: AppColor.yellow,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: size.width * 0.12,
                            height: size.height * 0.045,
                            child: RoundedActionButton(
                              onClick: () {
                                buyController.isSale.value=false;
                              },
                              label: 'Buys',
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 25),

                      Row(
                        children: [
                          Flexible(
                            child: DropDownInputField(
                              controller: TextEditingController(),
                              hintText: 'Select',
                              needValidation: false,
                              errorMessage: 'Please Fill Up This Form',
                              fieldTitle: 'Customer',
                              needTitle: true,
                              items: ["Day Labour", "Worker", "Seller"],
                              titleStyle: AppText().bodyMediumBold,
                            ),
                          ),

                          SizedBox(width: 10),

                          Flexible(
                            child: DropDownInputField(
                              controller: TextEditingController(),
                              hintText: 'Select',
                              needValidation: false,
                              errorMessage: 'Please Fill Up This Form',
                              fieldTitle: 'Rice Name',
                              needTitle: true,
                              items: ["Day Labour", "Worker", "Seller"],
                              titleStyle: AppText().bodyMediumBold,
                            ),
                          ),


                        ],
                      ),

                      SizedBox(height: 10),

                      Row(
                        children: [
                          Flexible(
                            child: DateTimeInputField(
                              controller: TextEditingController(),
                              hintText: '2024-08-16',
                              errorMessage: 'errorMessage',
                              fieldTitle: 'Selling Date',
                              needTitle: true,
                              needValidation: false,
                              dateTimeController: DateTimeController(),
                              suffixIcon: RIcon.Calendar,
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: SimpleInputField(
                              controller: TextEditingController(),
                              hintText: 'Enter Quantity',
                              errorMessage: 'errorMessage',
                              fieldTitle: 'Quantity(KG)',
                              needTitle: true,
                              needValidation: false,
                              titleStyle: AppText().bodyMediumBold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            child: SimpleInputField(
                              controller: TextEditingController(),
                              hintText: 'Enter Unit Price (Per KG)',
                              errorMessage: 'errorMessage',
                              fieldTitle: 'Expense Amount',
                              needTitle: true,
                              needValidation: false,
                              titleStyle: AppText().bodyMediumBold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: SimpleInputField(
                              controller: TextEditingController(),
                              hintText: '',
                              errorMessage: 'errorMessage',
                              fieldTitle: 'Total Price ',
                              needTitle: true,
                              needValidation: false,
                              titleStyle: AppText().bodyMediumBold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            child: SimpleInputField(
                              controller: TextEditingController(),
                              hintText: 'Enter Paid Amount',
                              errorMessage: 'errorMessage',
                              fieldTitle: 'Paid Amount',
                              needTitle: true,
                              needValidation: false,
                              titleStyle: AppText().bodyMediumBold,
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: SimpleInputField(
                              controller: TextEditingController(),
                              hintText: '',
                              errorMessage: 'errorMessage',
                              fieldTitle: 'Due Amount',
                              needTitle: true,
                              needValidation: false,
                              titleStyle: AppText().bodyMediumBold,
                            ),
                          ),
                        ],
                      ),


                      SizedBox(height: 10),

                      MultiLineInputField(
                        controller: TextEditingController(),
                        hintText: '',
                        needTitle: true,
                        fieldTitle: "Note",
                        numberOfLines: 3,
                      ),

                      SizedBox(height: 20),

                      SizedBox(
                        height: 40,
                        width: 100,
                        child: RoundedActionButton(
                          onClick: () {},
                          label: 'Add',
                        ),
                      ),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
