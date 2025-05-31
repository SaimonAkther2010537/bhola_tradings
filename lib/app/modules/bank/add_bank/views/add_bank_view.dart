import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../../core/widgets/input_widgets/drop-down_input_field.dart';
import '../../../../core/widgets/input_widgets/simple_input_field.dart';
import '../../bank_account/controllers/bank_account_controller.dart';
import '../controllers/add_bank_controller.dart';

class AddBankView extends GetView<AddBankController> {
  const AddBankView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final bankAccountController  = Get.find<BankAccountController>();
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
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "Add Bank",
                                style: AppText().headerLine3.copyWith(
                                  color: AppColor.yellow,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 100,
                            height: 40,
                            child: RoundedActionButton(
                              label: 'Back',
                              onClick: () {
                                bankAccountController.bank.value = '';
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      Row(
                        children: [
                          Flexible(
                            child: SimpleInputField(
                              controller: TextEditingController(),
                              hintText: 'Enter Bank Name',
                              errorMessage: 'errorMessage',
                              fieldTitle: 'Bank Name',
                              titleStyle: AppText().bodyMediumBold,
                              needTitle: true,
                              needValidation: false,
                            ),
                          ),

                          SizedBox(width: 10),

                          Flexible(
                            child: SimpleInputField(
                              controller: TextEditingController(),
                              hintText: 'Enter Branch Name',
                              errorMessage: 'errorMessage',
                              fieldTitle: 'Branch',
                              titleStyle: AppText().bodyMediumBold,
                              needTitle: true,
                              needValidation: false,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: size.width * 0.466,
                          child: DropDownInputField(
                            controller: TextEditingController(),
                            hintText: 'Select',
                            needValidation: false,
                            errorMessage: 'Please Fill Up This Form',
                            fieldTitle: 'Account Type',
                            needTitle: true,
                            items: ["Loan", "Seller", "Customer"],
                            titleStyle: AppText().bodyMediumBold,
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      SizedBox(
                        height: 40,
                        width: 150,
                        child: RoundedActionButton(
                          onClick: () {},
                          label: 'Add Bank',
                        ),
                      ),

                      SizedBox(height: 20),

                      ///********************************* Custom Data Table *********************************
                      Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ///********************************* Tab Bar Headings *********************************
                                Expanded(child: Text('Date', style: AppText().headerLine6.copyWith(color: AppColor.yellow))),
                                Expanded(child: Text('Bank Name', style: AppText().headerLine6.copyWith(color: AppColor.yellow))),
                                Expanded(child: Text('Type', style: AppText().headerLine6.copyWith(color: AppColor.yellow))),
                                Expanded(child: Text('Branch', style: AppText().headerLine6.copyWith(color: AppColor.yellow))),
                                Expanded(child: Center(child: Text('Actions', style: AppText().headerLine6.copyWith(color: AppColor.yellow)))),
                              ],
                            ),
                          ),

                          ///********************************* Table Data Rows *********************************

                          Column(
                            children: controller.customersList.map((customer) {
                              return Container(
                                clipBehavior: Clip.hardEdge,
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColor.bgLightColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(customer['date'] ,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppText().headerLine6Light.copyWith(color: AppColor.primaryBlack)),
                                    ),
                                    Expanded(child: Text(customer['name'], style: AppText().headerLine6Light.copyWith(color: AppColor.primaryBlack))),
                                    Expanded(
                                      child: Text(
                                        customer['type'],
                                        style: AppText().headerLine6Light.copyWith(color: AppColor.primaryBlack),
                                      ),
                                    ),
                                    Expanded(child: Text(customer['branch'], style: AppText().headerLine6Light.copyWith(color: AppColor.primaryBlack))),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            icon: Icon(RIcon.Pen_New_Round, color: AppColor.textLightBlack),
                                            onPressed: () {},
                                          ),
                                          IconButton(
                                            icon: Icon(RIcon.Trash_Bin_Minimalistic, color: AppColor.red),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),

                        ],
                      )),


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
