import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/custom_controllers/date_time_controller.dart';
import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/utility/validator.dart';
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
                  child: Form(
                    key: controller.fromKey,
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
                                  buyController.isSale.value = false;
                                },
                                label: 'Buy',
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 25),

                        Obx(
                          () => Row(
                            children: [
                              Flexible(
                                child: DropDownInputField(
                                  controller: controller.lotController,
                                  hintText: 'Select',
                                  fieldTitle: 'Lot Product',
                                  needSearch: true,
                                  needValidation: true,
                                  errorMessage: 'Please Fill Up This Form',
                                  needTitle: true,
                                  titleStyle: AppText().bodyMedium,
                                  itemBuilder:
                                      controller.getAllLotList.map((element) {
                                        return DropdownMenuItem(
                                          value:
                                              "${element.id.toString()} ${element.productName.toString()}",
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue.shade100,
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    element.id.toString(),
                                                    style: AppText().bodySmall,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 12),

                                              // Product Info Section
                                              Expanded(
                                                flex: 3,
                                                child: Text(
                                                  element.productName ?? '',
                                                  style:
                                                      AppText().bodyMediumBold,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),

                                              Material(
                                                color: AppColor.primaryGreen,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 2,
                                                      ),
                                                  child: Text(
                                                    '${element.remainingQuantity}KG',
                                                    style: AppText().bodySmall,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 15),

                                              Text(
                                                formatApiDate(
                                                  element.purchaseDate
                                                      .toString(),
                                                ),
                                                style: AppText().bodySmall,
                                                textAlign: TextAlign.end,
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: DropDownInputField(
                                  needSearch: true,
                                  controller: controller.customerController,
                                  hintText: 'Select',
                                  needValidation: true,
                                  errorMessage: 'Please Fill Up This Form',
                                  fieldTitle: 'Customer',
                                  needTitle: true,
                                  items:
                                      controller
                                          .entityController
                                          .getAllCustomerList
                                          .map(
                                            (element) =>
                                                element.name.toString(),
                                          )
                                          .toList(),
                                  titleStyle: AppText().bodyMediumBold,
                                  onValueChange: (value) {},
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10),

                        Row(
                          children: [
                            Flexible(
                              child: DateTimeInputField(
                                controller: controller.dateController,
                                hintText: '2024-08-16',
                                errorMessage: 'Please select a date',
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
                                controller: controller.quantityController,
                                hintText: 'Enter Quantity',
                                errorMessage: 'Enter A quantity (eg: 500)',
                                fieldTitle: 'Quantity(KG)',
                                needTitle: true,
                                needValidation: true,
                                validatorClass: Validator().validateEmpty,
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
                                controller: controller.unitPriceController,
                                hintText: 'Enter Unit Price (Per KG)',
                                errorMessage: 'Enter unit price',
                                fieldTitle: 'Unit Price Per (KG)',
                                needTitle: true,
                                needValidation: true,
                                titleStyle: AppText().bodyMediumBold,
                                validatorClass: Validator().validateEmpty,
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: SimpleInputField(
                                controller: controller.totalPriceController,
                                hintText: '',
                                errorMessage: 'errorMessage',
                                fieldTitle: 'Total Price ',
                                needTitle: true,
                                viewOnly: true,
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
                                controller: controller.paidPriceController,
                                hintText: 'Enter Paid Amount',
                                errorMessage: 'Enter Paid Amount',
                                fieldTitle: 'Paid Amount',
                                needTitle: true,
                                needValidation: false,
                                titleStyle: AppText().bodyMediumBold,
                                validatorClass: Validator().validateEmpty,
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: SimpleInputField(
                                controller: controller.duePriceController,
                                hintText: '',
                                errorMessage: 'errorMessage',
                                fieldTitle: 'Due Amount',
                                viewOnly: true,
                                needTitle: true,
                                needValidation: false,
                                titleStyle: AppText().bodyMediumBold,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10),

                        MultiLineInputField(
                          controller: controller.noteController,
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
                            onClick: () {
                              if (controller.fromKey.currentState!.validate()) {
                                controller.saleLot(context: context);
                              }
                            },
                            label: 'Add',
                          ),
                        ),
                      ],
                    ),
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
