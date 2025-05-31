
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
import '../../sub_transaction/views/sub_transaction_view.dart';
import '../controllers/debitors_or_creditors_controller.dart';
import '../widgets/update_account_popup.dart';

class DebitorsOrCreditorsView extends GetView<DebitorsOrCreditorsController> {
  const DebitorsOrCreditorsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Obx(() {
      return controller.debitCredit.value == controller.subTransaction ? SubTransactionView() : Scaffold(
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
                    Text(
                      "Add Account",
                      style: AppText().headerLine3.copyWith(
                        color: AppColor.yellow,
                        fontWeight: FontWeight.w300,
                      ),
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
                            hintText: 'Enter Name',
                            needValidation: true,
                            errorMessage: 'Please Fill Up This Form',
                            fieldTitle: 'Debitor Name',
                            needTitle: true,
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
                            hintText: 'Enter Phone',
                            needValidation: true,
                            errorMessage: 'Please Fill Up This Form',
                            fieldTitle: 'Phone',
                            needTitle: true,
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
                            fieldTitle: 'Initial Debit',
                            needTitle: true,
                            titleStyle: AppText().bodyMediumBold,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: size.width * 0.38,
                        child: DateTimeInputField(
                          controller: TextEditingController(),
                          hintText: '2025-04-40',
                          needValidation: false,
                          errorMessage: '',
                          dateTimeController: DateTimeController(),
                          fieldTitle: 'Date',
                        ),
                      ),
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
                        label: 'Add Account',
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

                    Text(
                      'All Debitors / Creditors',
                      style: AppText().headerLine6,
                    ),

                    SizedBox(height: 10),

                    Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                        width: size.width * 0.2,
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: DropDownInputField(
                                controller: TextEditingController(),
                                hintText: '2023',
                                needValidation: false,
                                errorMessage: '',
                                fieldTitle: '',
                                needTitle: false,
                                items: ['2022', '2023', '2024', '2025'],
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              flex: 2,
                              child: SimpleInputField(
                                controller: TextEditingController(),
                                hintText: 'Search ',
                                needValidation: true,
                                errorMessage: 'Please Fill Up This Form',
                                fieldTitle: '',
                                needTitle: false,
                                suffixIcon: RIcon.Magnifer,
                                titleStyle: AppText().bodyMediumBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    Obx(
                          () =>
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 12,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
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
                                        'Date',
                                        style: AppText().headerLine6.copyWith(
                                          color: AppColor.yellow,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Name',
                                        style: AppText().headerLine6.copyWith(
                                          color: AppColor.yellow,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Phone',
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
                                        'Balance(৳)',
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
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Material(
                                                color: Colors.transparent,
                                                borderRadius: BorderRadius
                                                    .circular(10),
                                                clipBehavior: Clip.hardEdge,
                                                child: InkWell(
                                                  hoverColor: AppColor.white,
                                                  onTap: () {
                                                    controller.debitCredit.value = controller.subTransaction;

                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 4),
                                                    child: Text(customer['id'],
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: AppText()
                                                            .headerLine6Light
                                                            .copyWith(
                                                            color: AppColor
                                                                .primaryBlack)),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                                            customer['name'],
                                            style: AppText().headerLine6Light
                                                .copyWith(
                                              color: AppColor.primaryBlack,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            customer['phone'],
                                            style: AppText().headerLine6Light
                                                .copyWith(
                                              color: AppColor.primaryBlack,
                                            ),
                                          ),
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
                                            customer['balance'],
                                            style: AppText().headerLine6Light
                                                .copyWith(
                                              color:
                                              double.parse(
                                                customer['balance']
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
                                            customer['note'],
                                            style: AppText().headerLine6Light
                                                .copyWith(
                                              color: AppColor.primaryBlack,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceEvenly,
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  RIcon.Pen_New_Round,
                                                  color: AppColor.primaryGreen,
                                                ),
                                                onPressed: () {
                                                  Get.dialog(
                                                      UpdateAccountPopup());
                                                },
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  RIcon.Trash_Bin_Minimalistic,
                                                  color: AppColor.red,
                                                ),
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
                          ),
                    ),
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
