import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../../core/widgets/input_widgets/drop-down_input_field.dart';
import '../../../../core/widgets/input_widgets/multi_line_input_field.dart';
import '../../../../core/widgets/input_widgets/simple_input_field.dart';
import '../../debitors_or_creditors/controllers/debitors_or_creditors_controller.dart';
import '../controllers/sub_transaction_controller.dart';

class SubTransactionView extends GetView<SubTransactionController> {
  const SubTransactionView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final debitorsOrCreditorsController  = Get.find<DebitorsOrCreditorsController>();

    return Scaffold(
      backgroundColor: AppColor.bgLightColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            clipBehavior: Clip.hardEdge,
            color: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
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
                            "Add Transaction",
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
                            debitorsOrCreditorsController.debitCredit.value = '';
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Row(
                    children: [
                      Flexible(
                        child: DropDownInputField(
                          controller: TextEditingController(),
                          hintText: 'Select Transaction Type',
                          needValidation: true,
                          errorMessage: 'Please Fill Up This Form',
                          fieldTitle: 'Transaction Type',
                          needTitle: true,
                          items: ["Cash In", "Cash Out"],
                          titleStyle: AppText().bodyMediumBold,
                        ),
                      ),

                      SizedBox(width: 10),

                      Flexible(
                        child: SimpleInputField(
                          controller: TextEditingController(),
                          hintText: 'Enter Amount',
                          needValidation: true,
                          errorMessage: 'Please Fill Up This Form',
                          fieldTitle: 'Amount',
                          needTitle: true,
                          titleStyle: AppText().bodyMediumBold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  MultiLineInputField(
                    controller: TextEditingController(),
                    hintText: "",
                    fieldTitle: "Note",
                    numberOfLines: 3,
                    needTitle: true,
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    height: 40,
                    width: 160,
                    child: RoundedActionButton(
                      onClick: () {},
                      label: 'Add Transaction',
                    ),
                  ),

                  SizedBox(height: 20),

                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      height: 40,
                      width: 160,
                      child: RoundedActionButton(
                        onClick: () {},
                        label: 'Export PDF',
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  RichText(text: TextSpan(
                    text: 'Transaction of',
                    style: AppText().headerLine6Light,
                    children: [
                      TextSpan(
                        text: 'Md Yeard',
                        style: AppText().headerLine6
                      )
                    ]
                  )),



                  SizedBox(height: 20),

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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ///********************************* Tab Bar Headings *********************************
                              Expanded(
                                child: Text(
                                  'Id',
                                  style: AppText().headerLine6.copyWith(
                                    color: AppColor.yellow,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Type',
                                  style: AppText().headerLine6.copyWith(
                                    color: AppColor.yellow,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                    'Amount(৳)',
                                  style: AppText().headerLine6.copyWith(
                                    color: AppColor.yellow,
                                  ),
                                ),
                              ),
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
                                  'Transactor',
                                  style: AppText().headerLine6.copyWith(
                                    color: AppColor.yellow,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Note',
                                  style: AppText().headerLine6.copyWith(
                                    color: AppColor.yellow,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Action',
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
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.bgLightColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(customer['id'] ,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppText().headerLine6Light.copyWith(color: AppColor.primaryBlack)),
                                  ),
                                  Expanded(
                                    child: Text(
                                      customer['type'],
                                      style: AppText().headerLine6Light
                                          .copyWith(
                                        color: AppColor.primaryBlack,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      customer['amount'],
                                      style: AppText().headerLine6Light
                                          .copyWith(
                                        color:
                                        double.parse(
                                          customer['amount']
                                              .replaceAll(
                                            ',',
                                            '',
                                          ),
                                        ) >
                                            0
                                            ? AppColor.red
                                            : AppColor.primaryGreen,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      customer['date'],
                                      style: AppText().headerLine6Light
                                          .copyWith(
                                        color: AppColor.primaryBlack,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      customer['transactor'],
                                      style: AppText().headerLine6Light
                                          .copyWith(
                                        color: AppColor.primaryBlack,
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: Text(
                                      customer['note'],
                                      style: AppText().headerLine6Light
                                          .copyWith(
                                        color: AppColor.primaryBlack,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: Icon(
                                        RIcon.Trash_Bin_Minimalistic,
                                        color: AppColor.red,
                                      ),
                                      onPressed: () {},
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
        ),
      ),
    );
  }
}
