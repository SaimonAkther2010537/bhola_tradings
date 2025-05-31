
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import '../../../core/theme/app_color_config.dart';
import '../../../core/theme/text_config.dart';
import '../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../core/widgets/custom_tabbar.dart';
import '../../../core/widgets/input_widgets/simple_input_field.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/dashboard_card.dart'; // Import custom tab bar

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColor.bgLightColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ///********************************************** Statistic Card **************************************
              Card(
                color: AppColor.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //test==
                      Text(
                        'Statistics',
                        style: TextStyle(
                          color: AppColor.yellow,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),

                      /// =================== Custom TabBar (Statistics) ===================
                      CustomTabBar(
                        showSearchBar: true,
                        searchBarWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: size.width * 0.20,
                              child: SimpleInputField(
                                controller: controller.searchController,
                                hintText: 'Search',
                                errorMessage: '',
                                needTitle: true,
                                fieldTitle: "Rice Name",
                                titleStyle: AppText().bodyMediumBold,
                                suffixIcon: RIcon.Rounded_Magnifer,
                                backgroundColor: AppColor.bgLightColor,
                                onValueChange: (value) {},
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Filtered Date',
                                  style: AppText().buttonLarge,
                                ),
                                Text(
                                  '01-02-2025',
                                  style: AppText().headerLine7.copyWith(
                                    color: AppColor.yellow,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        tabViews: [
                          /// =================== Today Data ===================
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.bgLightColor,
                            clipBehavior: Clip.hardEdge,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 10,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 7,
                                    ),
                                itemBuilder: (context, index) {
                                  return DashboardCard(
                                    title: 'Total Price',
                                    icon: RIcon.Login,
                                    amount: '000',
                                  );
                                },
                              ),
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
              SizedBox(height: 20),

              ///********************************************** Transaction Card **************************************
              Card(
                color: AppColor.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Transaction',
                        style: TextStyle(
                          color: AppColor.yellow,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),

                      /// =================== Custom TabBar (Transaction) ===================
                      CustomTabBar(
                        showSearchBar: true,
                        searchBarWidget: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Purchase Transactions',
                                  style: AppText().headerLine4.copyWith(
                                    color: AppColor.primaryBlack,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RichText(text: TextSpan(
                                    text: 'Total Paid: ',
                                    style: AppText().headerLine6Light,
                                    children: [
                                      TextSpan(
                                          text: '0.0',
                                          style: AppText().headerLine6
                                      )
                                    ]
                                )),

                                RichText(text: TextSpan(
                                    text: 'Total Due: ',
                                    style: AppText().headerLine6Light,
                                    children: [
                                      TextSpan(
                                          text: '0.0',
                                          style: AppText().headerLine6
                                      )
                                    ]
                                )),
                              ],
                            ),
                          ],
                        ),
                        tabViews: [
                          ListView.builder(
                            itemCount: 20,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text('Transaction Data $index'),
                                  Text('Amount: \$${index * 10}'),
                                ],
                              );
                            },
                          ),
                          Center(
                            child: Text(
                              "Yesterday's Transactions",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Last Week's Transactions",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Last Month's Transactions",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Custom Transactions",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sale Transactions',
                            style: AppText().headerLine4.copyWith(
                              color: AppColor.primaryBlack,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RichText(text: TextSpan(
                            text: 'Total Paid: ',
                            style: AppText().headerLine6Light,
                            children: [
                              TextSpan(
                                text: '0.0',
                                style: AppText().headerLine6
                              )
                            ]
                          )),

                          RichText(text: TextSpan(
                              text: 'Total Due: ',
                              style: AppText().headerLine6Light,
                              children: [
                                TextSpan(
                                    text: '0.0',
                                    style: AppText().headerLine6
                                )
                              ]
                          )),
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
