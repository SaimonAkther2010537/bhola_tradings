import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../../core/widgets/custom_tabbar.dart';
import '../../expense/controllers/expense_controller.dart';
import '../controllers/expense_details_controller.dart';

class ExpenseDetailsView extends GetView<ExpenseDetailsController> {
  const ExpenseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final expenseController = Get.find<ExpenseController>();
    return Scaffold(
      backgroundColor: AppColor.bgLightColor,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            expenseController.expenseType.value = '';
          },
          icon: Icon(RIcon.Arrow_Left),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
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
                        searchBarWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        tabViews: [
                          /// =================== Today Data ===================
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
                                          'ID',
                                          style: AppText().headerLine6.copyWith(
                                            color: AppColor.yellow,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Entry Man',
                                          style: AppText().headerLine6.copyWith(
                                            color: AppColor.yellow,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8.0,
                                          ),
                                          child: Text(
                                            'Product',
                                            style: AppText().headerLine6
                                                .copyWith(
                                                  color: AppColor.yellow,
                                                ),
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
                                            style: AppText().headerLine6
                                                .copyWith(
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
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Material(
                                                      color: Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                      clipBehavior:
                                                          Clip.hardEdge,
                                                      child: InkWell(
                                                        hoverColor:
                                                            AppColor.white,
                                                        onTap: () {},
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.symmetric(
                                                                horizontal: 10,
                                                                vertical: 4,
                                                              ),
                                                          child: Text(
                                                            customer['product'],
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: AppText()
                                                                .headerLine6Light
                                                                .copyWith(
                                                                  color:
                                                                      AppColor
                                                                          .primaryBlack,
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
    );
  }
}
