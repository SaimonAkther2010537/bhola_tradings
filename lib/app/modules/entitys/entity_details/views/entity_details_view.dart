
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../../core/custom_controllers/date_time_controller.dart';
import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../../core/widgets/custom_column_text.dart';
import '../../../../core/widgets/input_widgets/dateTime_input_field.dart';
import '../../../../core/widgets/input_widgets/drop-down_input_field.dart';
import '../../entity/controllers/entity_controller.dart';
import '../controllers/entity_details_controller.dart';
import '../widgets/due_payment_popup.dart';

class EntityDetailsView extends GetView<EntityDetailsController> {
  const EntityDetailsView({super.key});

  @override
  Widget build(BuildContext context) {

    final entityController = Get.find<EntityController>();
    return Scaffold(
      backgroundColor: AppColor.scaffoldColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Card(
                color: AppColor.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Summery Of ',

                                  style: AppText().headerLine4.copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                  ),

                                  children: [
                                    TextSpan(
                                      text: ' 24 Akbar Mia',
                                      style: AppText().headerLine3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 40,
                            width: 80,
                            child: RoundedActionButton(
                              onClick: () {
                                entityController.entity.value = '';
                              },
                              label: 'Back',
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          CustomColumnText(
                            title: 'Total Amount',
                            value: '43,990.00',
                          ),
                          CustomColumnText(
                            title: 'Paid Amount',
                            value: '67,900.00',
                          ),
                          CustomColumnText(
                            title: 'Due Amount',
                            value: '13,990.00',
                          ),

                        ],
                      ),

                      SizedBox(height: 10),

                      RichText(
                        text: TextSpan(
                          text: 'All Transaction Of ',

                          style: AppText().headerLine4.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),

                          children: [
                            TextSpan(
                              text: ' 24 Akbar Mia',
                              style: AppText().headerLine3,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),

                      Row(
                        children: [
                          Expanded(
                            child: DropDownInputField(
                              controller: TextEditingController(),
                              hintText: 'Select',
                              needValidation: false,
                              errorMessage: 'Please Select Any Product',
                              fieldTitle: '',
                              items: ['All Product', 'Rice'],
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: DateTimeInputField(
                              controller: TextEditingController(),
                              hintText: '12-09-2025',
                              needValidation: false,
                              errorMessage: 'Select a Date',
                              dateTimeController: DateTimeController(),
                              fieldTitle: '',

                              suffixIcon: RIcon.Calendar,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      ///********************************* Custom Data Table *********************************
                      Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 12,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ///********************************* Tab Bar Headings *********************************
                                  Expanded(
                                    child: Text(
                                      'Date',
                                      style: AppText().headerLine6.copyWith(
                                        color: AppColor.yellow,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Sale Id',
                                      style: AppText().headerLine6.copyWith(
                                        color: AppColor.yellow,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Rice Name',
                                      style: AppText().headerLine6.copyWith(
                                        color: AppColor.yellow,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Quantity(KG)',
                                        style: AppText().headerLine6.copyWith(
                                          color: AppColor.yellow,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Price(৳)',
                                        style: AppText().headerLine6.copyWith(
                                          color: AppColor.yellow,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Paid',
                                        style: AppText().headerLine6.copyWith(
                                          color: AppColor.yellow,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Due',
                                        style: AppText().headerLine6.copyWith(
                                          color: AppColor.yellow,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Last Balance',
                                        style: AppText().headerLine6.copyWith(
                                          color: AppColor.yellow,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ///********************************* Table Data Rows *********************************
                            Column(
                              children:
                                  controller.customersList.map((customer) {
                                    return Container(
                                      clipBehavior: Clip.hardEdge,
                                      margin: EdgeInsets.only(bottom: 10),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: AppColor.bgLightColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              customer['date'],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppText().headerLine6Light
                                                  .copyWith(
                                                    color:
                                                        AppColor.primaryBlack,
                                                  ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              customer['sale id'],
                                              style: AppText().headerLine6Light
                                                  .copyWith(
                                                    color:
                                                        AppColor.primaryBlack,
                                                  ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              customer['rice name'],
                                              style: AppText().headerLine6Light
                                                  .copyWith(
                                                    color: AppColor.primaryBlack,
                                                  ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                customer['quantity'],
                                                style: AppText()
                                                    .headerLine6Light
                                                    .copyWith(
                                                      color:
                                                          AppColor.primaryBlack,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                "${customer['price']}৳",
                                                style: AppText()
                                                    .headerLine6Light
                                                    .copyWith(
                                                      color:
                                                          AppColor.primaryBlack,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                customer['paid'],
                                                style: AppText()
                                                    .headerLine6Light
                                                    .copyWith(
                                                      color:
                                                          AppColor.primaryBlack,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Material(
                                                  color: Colors.transparent,
                                                  borderRadius: BorderRadius.circular(10),
                                                  clipBehavior: Clip.hardEdge,
                                                  child: InkWell(
                                                    hoverColor: AppColor.white,
                                                    onTap: () {
                                                      Get.dialog(DuePaymentPopup());
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                                      child: Text(customer['due'] ,
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: AppText().headerLine6Light.copyWith(color: AppColor.primaryBlack)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                customer['last_balance'],
                                                style: AppText()
                                                    .headerLine6Light
                                                    .copyWith(
                                                  color:
                                                  AppColor.primaryBlack,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                            ),
                          ],
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
