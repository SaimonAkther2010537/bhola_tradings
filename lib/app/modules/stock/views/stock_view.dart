
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import '../../../core/theme/app_color_config.dart';
import '../../../core/theme/text_config.dart';
import '../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../core/widgets/custom_rich_text.dart';
import '../../../core/widgets/custom_tabbar.dart';
import '../../../core/widgets/input_widgets/simple_input_field.dart';
import '../controllers/stock_controller.dart';
import '../widgets/add_product_popup.dart';
import '../widgets/stock_card.dart';

class StockView extends GetView<StockController> {
  const StockView({super.key});

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
                                "Available Stock",
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
                                Get.dialog(AddProductPopup());
                              },
                              label: 'Add Product',
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 25),

                      /// =========================== Total KG ====================================
                      CustomRichText(amount: "1267"),

                      SizedBox(height: 10),

                      /// =========================== Search Bar ====================================
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: size.width * 0.20,
                          child: SimpleInputField(
                            controller: controller.searchController,
                            hintText: 'Search Product Name',
                            errorMessage: '',
                            needTitle: false,
                            fieldTitle: "",
                            titleStyle: AppText().bodyMediumBold,
                            suffixIcon: RIcon.Rounded_Magnifer,
                            backgroundColor: AppColor.bgLightColor,
                            onValueChange: (value) {},
                          ),
                        ),
                      ),

                      SizedBox(height: 15),

                      GridView.builder(
                        itemCount: controller.stockItems.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 3,
                            ),
                        itemBuilder: (context, index) {
                          return StockCard(
                            productName: controller.stockItems[index]["name"]!,
                            value: controller.stockItems[index]["value"]!,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              ///********************************************** Stock In Card **************************************
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
                      CustomTabBar(
                        showSearchBar: true,
                        searchBarWidget: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: size.width * 0.20,
                                child: SimpleInputField(
                                  controller: controller.searchController,
                                  hintText: 'Search',
                                  errorMessage: '',
                                  needTitle: false,
                                  fieldTitle: "",
                                  // titleStyle: AppText().bodyMediumBold,
                                  suffixIcon: RIcon.Rounded_Magnifer,
                                  backgroundColor: AppColor.bgLightColor,
                                  onValueChange: (value) {},
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Stock In', style: AppText().headerLine3),
                                CustomRichText(amount: "1267"),
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
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 3,
                                    ),
                                itemBuilder: (context, index) {
                                  return StockCard(
                                    value: "45",
                                    productName: 'Demo Product',
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

                      /// =================== Custom TabBar (Transaction) ===================
                    ],
                  ),
                ),
              ),

              ///********************************************** Stock Out Card **************************************

              SizedBox(height: 20),

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
                      CustomTabBar(
                        showSearchBar: true,
                        searchBarWidget: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: size.width * 0.20,
                                child: SimpleInputField(
                                  controller: controller.searchController,
                                  hintText: 'Search',
                                  errorMessage: '',
                                  needTitle: false,
                                  fieldTitle: "",
                                  // titleStyle: AppText().bodyMediumBold,
                                  suffixIcon: RIcon.Rounded_Magnifer,
                                  backgroundColor: AppColor.bgLightColor,
                                  onValueChange: (value) {},
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Stock Out', style: AppText().headerLine3),
                                CustomRichText(amount: "67"),
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
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 3,
                                ),
                                itemBuilder: (context, index) {
                                  return StockCard(
                                    value: "45",
                                    productName: 'Demo Product',
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

                      /// =================== Custom TabBar (Transaction) ===================
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
