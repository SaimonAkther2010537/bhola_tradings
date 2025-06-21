
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../../core/custom_controllers/date_time_controller.dart';
import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/utility/validator.dart';
import '../../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../../core/widgets/input_widgets/dateTime_input_field.dart';
import '../../../../core/widgets/input_widgets/drop-down_input_field.dart';
import '../../../../core/widgets/input_widgets/multi_line_input_field.dart';
import '../../../../core/widgets/input_widgets/simple_input_field.dart';
import '../../sale/views/sale_view.dart';
import '../controllers/buy_controller.dart';

class BuyView extends GetView<BuyController> {
  const BuyView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return  Obx(()=>controller.isSale.value?SaleView():
    Scaffold(
      backgroundColor: AppColor.bgLightColor,
      body: SingleChildScrollView(
        child:    Padding(
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
                                  "Buy Transaction",
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
                                  controller.isSale.value=true;
                                 // Get.toNamed(Routes.SALE);
                                },
                                label: 'Sale',
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 25),

                        Row(
                          children: [
                            Flexible(
                              child: DropDownInputField(
                                needSearch: true,
                                controller: controller.vendorController,
                                hintText: 'Select',
                                needValidation: true,
                                errorMessage: 'Please Fill Up This Form',
                                fieldTitle: 'Vendor',
                                needTitle: true,
                                items: controller.entityController.allVendorList.map((element) => element.name.toString()).toList(),
                                titleStyle: AppText().bodyMediumBold,
                                onValueChange: (value){

                                },
                              ),
                            ),

                            SizedBox(width: 10),

                            Flexible(
                              child: DropDownInputField(
                                needSearch: true,
                                controller: controller.productController,
                                hintText: 'Select',
                                needValidation: true,
                                errorMessage: 'Please Fill Up This Form',
                                fieldTitle: 'Product Name',
                                needTitle: true,
                                items: controller.stockController.allProductList.map((element) => element.name.toString()).toList(),
                                titleStyle: AppText().bodyMediumBold,
                                onValueChange: (value){
                                  // print(value);
                                },
                              ),
                            ),


                          ],
                        ),

                        SizedBox(height: 10),

                        Row(
                          children: [
                            Flexible(
                              child: DateTimeInputField(
                                controller: controller.dateController,
                                hintText: 'Enter a date',
                                errorMessage: 'Enter a date',
                                fieldTitle: 'Buying Date',
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
                                errorMessage: 'Please enter quantity',
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
                                errorMessage: 'please enter unit price',
                                fieldTitle: 'Unit Price',
                                needTitle: true,
                                needValidation: true,
                                validatorClass: Validator().validateEmpty,
                                titleStyle: AppText().bodyMediumBold,
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: SimpleInputField(
                                controller:controller.totalPriceController,
                                hintText: '0.0',
                                errorMessage: '',
                                fieldTitle: 'Total Price ',
                                needTitle: true,
                                needValidation: false,
                                viewOnly: true,
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
                                errorMessage: 'Enter paid amount',
                                fieldTitle: 'Paid Amount',
                                needTitle: true,
                                needValidation: false,
                                titleStyle: AppText().bodyMediumBold,
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: SimpleInputField(
                                controller: controller.duePriceController,
                                hintText: '0.0',
                                errorMessage: '',
                                fieldTitle: 'Due Amount',
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
                                controller: controller.expenseController,
                                hintText: 'Enter Expense Price',
                                errorMessage: 'errorMessage',
                                fieldTitle: 'Expense',
                                needTitle: true,
                                needValidation: true,
                                validatorClass: Validator().validateEmpty,
                                titleStyle: AppText().bodyMediumBold,
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: SimpleInputField(
                                controller: controller.truckNumberController,
                                hintText: 'Truck Number',
                                errorMessage: 'errorMessage',
                                fieldTitle: 'Truck Number',
                                needTitle: true,
                                needValidation: true,
                                validatorClass: Validator().validateEmpty,
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
                                controller.buyLot(context: context);
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
    ));
  }
}
