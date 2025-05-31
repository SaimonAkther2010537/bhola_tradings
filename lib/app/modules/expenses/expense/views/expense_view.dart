
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../../core/widgets/custom_tabbar.dart';
import '../../../../core/widgets/input_widgets/drop-down_input_field.dart';
import '../../../../core/widgets/input_widgets/multi_line_input_field.dart';
import '../../../../core/widgets/input_widgets/simple_input_field.dart';
import '../../expense_details/views/expense_details_view.dart';
import '../../expense_type/views/expense_type_view.dart';
import '../../product_expense/views/product_expense_view.dart';
import '../controllers/expense_controller.dart';

class ExpenseView extends GetView<ExpenseController> {
  const ExpenseView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Obx(
      () =>
          controller.expenseType.value == controller.productExpense
              ? ProductExpenseView()
              : controller.expenseType.value == controller.expenseTypes
              ? ExpenseTypeView()
              : controller.expenseType.value == controller.expenseDetails
              ? ExpenseDetailsView()
              : Scaffold(
                backgroundColor: AppColor.bgLightColor,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        ///********************************************** Available Stock Card **************************************
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
                                          "Add Expense",
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
                                          controller.expenseType.value =
                                              controller.productExpense;
                                          // Get.toNamed(Routes.PRODUCT_EXPENSE);
                                        },
                                        label: 'Product Expense',
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    SizedBox(
                                      width: size.width * 0.12,
                                      height: size.height * 0.045,
                                      child: RoundedActionButton(
                                        onClick: () {
                                          controller.expenseType.value =
                                              controller.expenseTypes;

                                          // Get.toNamed(Routes.EXPENSE_TYPE);
                                        },
                                        label: 'Expense Type',
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
                                        errorMessage:
                                            'Please Fill Up This Form',
                                        fieldTitle: 'Expense Type',
                                        needTitle: true,
                                        items: [
                                          "Day Labour",
                                          "Worker",
                                          "Seller",
                                        ],
                                        titleStyle: AppText().bodyMediumBold,
                                      ),
                                    ),

                                    SizedBox(width: 10),

                                    Flexible(
                                      child: SimpleInputField(
                                        controller: TextEditingController(),
                                        hintText: 'Enter Expense Amount',
                                        errorMessage: 'errorMessage',
                                        fieldTitle: 'Expense Amount',
                                        needTitle: true,
                                        needValidation: false,
                                        titleStyle: AppText().bodyMediumBold,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 10),

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    width: size.width * 0.38,
                                    child: SimpleInputField(
                                      controller: TextEditingController(),
                                      hintText: '2025-09-09',
                                      errorMessage: '',
                                      needTitle: true,
                                      fieldTitle: "Date",
                                      suffixIcon: RIcon.Calendar,
                                    ),
                                  ),
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
                        SizedBox(height: 20),
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
                                /// =================== Custom TabBar (Statistics) ===================
                                CustomTabBar(
                                  showSearchBar: true,
                                  searchBarWidget: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: SizedBox(
                                          width: size.width * 0.20,
                                          child: DropDownInputField(
                                            controller: TextEditingController(),
                                            hintText: 'Select',
                                            errorMessage: '',
                                            needTitle: true,
                                            fieldTitle: "Select Type ",
                                            needValidation: false,
                                            items: ['A', "B", "C"],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: 'Total: ',
                                              style: AppText().headerLine6Light,
                                              children: [
                                                TextSpan(
                                                  text: '651262',
                                                  style: AppText().headerLine6,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                            width: 150,
                                            child: RoundedActionButton(
                                              onClick: () {},
                                              label: 'Export PDF',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  tabViews: [
                                    /// =================== Today Data ===================
                                    Obx(
                                      () => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal: 12,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ///********************************* Tab Bar Headings *********************************
                                                Expanded(
                                                  child: Text(
                                                    'Date',
                                                    style: AppText().headerLine6
                                                        .copyWith(
                                                          color:
                                                              AppColor.yellow,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'ID',
                                                    style: AppText().headerLine6
                                                        .copyWith(
                                                          color:
                                                              AppColor.yellow,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Entry Man',
                                                    style: AppText().headerLine6
                                                        .copyWith(
                                                          color:
                                                              AppColor.yellow,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          left: 8.0,
                                                        ),
                                                    child: Text(
                                                      'Type',
                                                      style: AppText()
                                                          .headerLine6
                                                          .copyWith(
                                                            color:
                                                                AppColor.yellow,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Amount(৳)',
                                                    style: AppText().headerLine6
                                                        .copyWith(
                                                          color:
                                                              AppColor.yellow,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'Note',
                                                    style: AppText().headerLine6
                                                        .copyWith(
                                                          color:
                                                              AppColor.yellow,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      'Action',
                                                      style: AppText()
                                                          .headerLine6
                                                          .copyWith(
                                                            color:
                                                                AppColor.yellow,
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
                                                controller.customersList.map((
                                                  customer,
                                                ) {
                                                  return Container(
                                                    clipBehavior: Clip.hardEdge,
                                                    margin: EdgeInsets.only(
                                                      bottom: 10,
                                                    ),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                          vertical: 4,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColor.bgLightColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            customer['date'],
                                                            style: AppText()
                                                                .headerLine6Light
                                                                .copyWith(
                                                                  color:
                                                                      AppColor
                                                                          .primaryBlack,
                                                                ),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Text(
                                                            customer['id'],
                                                            style: AppText()
                                                                .headerLine6Light
                                                                .copyWith(
                                                                  color:
                                                                      AppColor
                                                                          .primaryBlack,
                                                                ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            customer['entryMan'],
                                                            style: AppText()
                                                                .headerLine6Light
                                                                .copyWith(
                                                                  color:
                                                                      AppColor
                                                                          .primaryBlack,
                                                                ),
                                                          ),
                                                        ),

                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: [
                                                              Material(
                                                                color:
                                                                    Colors
                                                                        .transparent,
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      10,
                                                                    ),
                                                                clipBehavior:
                                                                    Clip.hardEdge,
                                                                child: InkWell(
                                                                  hoverColor:
                                                                      AppColor
                                                                          .white,
                                                                  onTap: () {
                                                                    controller.expenseType.value =
                                                                        controller.expenseDetails;
                                                                  },
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          10,
                                                                      vertical:
                                                                          4,
                                                                    ),
                                                                    child: Text(
                                                                      customer['type'],
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: AppText()
                                                                          .headerLine6Light
                                                                          .copyWith(
                                                                            color:
                                                                                AppColor.primaryBlack,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            customer['amount'],
                                                            style: AppText()
                                                                .headerLine6Light
                                                                .copyWith(
                                                                  color:
                                                                      AppColor
                                                                          .primaryBlack,
                                                                ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            customer['note'],
                                                            style: AppText()
                                                                .headerLine6Light
                                                                .copyWith(
                                                                  color:
                                                                      AppColor
                                                                          .primaryBlack,
                                                                ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: IconButton(
                                                            icon: Icon(
                                                              RIcon
                                                                  .Trash_Bin_Minimalistic,
                                                              color:
                                                                  AppColor.red,
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

                                    Center(
                                      child: Text(
                                        "Yesterday's Data",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "Last Week's Data",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "Last Month's Data",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Center(
                                      child: Text(
                                        "Custom Date Range Data",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
    );
  }
}
