
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

import '../../add_bank/views/add_bank_view.dart';
import '../../bank_details/views/bank_details_view.dart';
import '../controllers/bank_account_controller.dart';
import '../widgets/bank_card.dart';
import '../widgets/update_bank_transaction_popup.dart';

class BankAccountView extends GetView<BankAccountController> {
  const BankAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Obx(() {
      return controller.bank.value == controller.addEdit ?
      AddBankView() : controller.bank.value == controller.bankDetails ?
          BankDetailsView() :
      Scaffold(
        backgroundColor: AppColor.scaffoldColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              clipBehavior: Clip.hardEdge,
              color: AppColor.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "Add Bank Transaction ",
                              style: AppText().headerLine3.copyWith(
                                color: AppColor.yellow,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          width: 180,
                          height: 40,
                          child: RoundedActionButton(
                            label: 'Add / Edit Bank',
                            onClick: () {
                              controller.bank.value = controller.addEdit;
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
                            hintText: 'Select',
                            needValidation: false,
                            errorMessage: 'Please Fill Up This Form',
                            fieldTitle: 'Select Bank',
                            needTitle: true,
                            items: ["NBC", "EBL", "SIBL", "DBBL"],
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
                            fieldTitle: 'Account Type',
                            needTitle: true,
                            items: [
                              "Loan(Credit)",
                              "Loan(Debit)",
                              "Sellers Account",
                            ],
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
                            hintText: 'Enter Amount',
                            errorMessage: 'errorMessage',
                            fieldTitle: 'Total Amount',
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
                            errorMessage: "errorMessage",
                            dateTimeController: DateTimeController(),
                            suffixIcon: RIcon.Calendar,
                            fieldTitle: 'Date',
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    SimpleInputField(
                      controller: TextEditingController(),
                      hintText: 'Enter Interest Rate',
                      errorMessage: 'errorMessage',
                      fieldTitle: 'Interest Rate',
                      titleStyle: AppText().bodyMediumBold,
                      needTitle: true,
                      needValidation: false,
                    ),

                    SizedBox(height: 10),

                    MultiLineInputField(
                      controller: TextEditingController(),
                      hintText: "",
                      fieldTitle: "Note",
                      numberOfLines: 3,
                      needTitle: true,
                      // needValidation: false,
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

                    const SizedBox(height: 20),

                    Center(
                      child: Text(
                        "Recent Transaction",
                        style: AppText().headerLine3.copyWith(
                          color: AppColor.yellow,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: size.width * 0.25,
                        child: SimpleInputField(
                          controller: TextEditingController(),
                          hintText: 'Search Name',
                          errorMessage: 'errorMessage',
                          fieldTitle: '',
                          titleStyle: AppText().bodyMediumBold,
                          needTitle: false,
                          suffixIcon: RIcon.Magnifer,
                          needValidation: true,
                        ),
                      ),
                    ),


                    const SizedBox(height: 20),

                    ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20),
                      itemCount: 4,
                      shrinkWrap: true,

                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return BankCard(
                          editTap: () {
                            Get.dialog(UpdateBankTransactionPopup());
                          },

                          viewTap: () {
                            controller.bank.value = controller.bankDetails;
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
