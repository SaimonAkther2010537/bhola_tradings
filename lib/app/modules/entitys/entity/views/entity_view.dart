
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../core/widgets/input_widgets/drop-down_input_field.dart';
import '../../../../core/widgets/input_widgets/simple_input_field.dart';
import '../../../../core/widgets/messsage_box.dart';
import '../../entity_details/views/entity_details_view.dart';
import '../controllers/entity_controller.dart';
import '../widgets/add_entity_popup.dart';
import '../widgets/customer_card.dart';
import '../widgets/pay_popup.dart';
import '../widgets/vendor_card.dart';

class EntityView extends GetView<EntityController> {
  const EntityView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Obx(() {
      return controller.entity.value == controller.entityDetails
          ? EntityDetailsView()
          : Scaffold(
            backgroundColor: AppColor.bgLightColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ///=========================== Customer ==============================
                    Card(
                      color: AppColor.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Entities",
                                style: AppText().headerLine4,
                              ),
                            ),
                            SizedBox(height: 10),

                            /// ********************************* Year Searchbar and Add Entities Button *********************************
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: size.width * 0.08,
                                  child: DropDownInputField(
                                    controller: TextEditingController(),
                                    hintText: '2024',
                                    needValidation: false,
                                    errorMessage: '',
                                    fieldTitle: '',
                                    needTitle: false,
                                    items: ['2024', '2023', '2022'],
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.12,
                                  height: size.height * 0.045,
                                  child: RoundedActionButton(
                                    onClick: () {
                                      Get.dialog(AddEntityPopup());
                                    },
                                    label: 'Add Entities',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Text(
                                "Customers",
                                style: AppText().headerLine3,
                              ),
                            ),
                            SizedBox(height: 10),

                            ///********************************* Custom Searchbar *********************************
                            SizedBox(
                              width: size.width * 0.20,
                              child: SimpleInputField(
                                controller: TextEditingController(),
                                hintText: 'Search',
                                errorMessage: '',
                                needTitle: false,
                                fieldTitle: "Rice Name",
                                titleStyle: AppText().bodyMediumBold,
                                suffixIcon: RIcon.Rounded_Magnifer,
                                backgroundColor: AppColor.bgLightColor,
                                onValueChange: (value) {},
                              ),
                            ),
                            SizedBox(height: 20),

                            ///********************************* Custom Data Table *********************************
                            Column(
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
                                          'Amount',
                                          style: AppText().headerLine6.copyWith(
                                            color: AppColor.yellow,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Address',
                                          style: AppText().headerLine6.copyWith(
                                            color: AppColor.yellow,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'Actions',
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
                                controller.isLoading == true
                                    ? Loading()
                                    : controller.getAllCustomerList.isEmpty
                                    ? MessageBox(message: 'No data found')
                                    : ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      clipBehavior: Clip.hardEdge,
                                      itemCount:
                                          controller.getAllCustomerList.length,
                                      itemBuilder: (context, index) {
                                        final data =
                                            controller
                                                .getAllCustomerList[index];
                                        return CustomerCard(
                                          name: data.name.toString(),
                                          phone: data.phone.toString(),
                                          address: data.address.toString(),
                                        );
                                      },
                                    ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    ///=========================== Vendor ==============================
                    Card(
                      color: AppColor.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// ********************************* Year Searchbar and Add Entities Button *********************************
                            Center(
                              child: Text(
                                "Vendors",
                                style: AppText().headerLine3,
                              ),
                            ),
                            SizedBox(height: 10),

                            ///********************************* Custom Searchbar *********************************
                            SizedBox(
                              width: size.width * 0.20,
                              child: SimpleInputField(
                                controller: TextEditingController(),
                                hintText: 'Search',
                                errorMessage: '',
                                needTitle: false,
                                fieldTitle: "Rice Name",
                                titleStyle: AppText().bodyMediumBold,
                                suffixIcon: RIcon.Rounded_Magnifer,
                                backgroundColor: AppColor.bgLightColor,
                                onValueChange: (value) {},
                              ),
                            ),
                            SizedBox(height: 20),

                            ///********************************* Custom Data Table *********************************
                            Column(
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
                                          'Name',
                                          style: AppText().headerLine6
                                              .copyWith(
                                            color: AppColor.yellow,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Phone',
                                          style: AppText().headerLine6
                                              .copyWith(
                                            color: AppColor.yellow,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Amount',
                                          style: AppText().headerLine6
                                              .copyWith(
                                            color: AppColor.yellow,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Address',
                                          style: AppText().headerLine6
                                              .copyWith(
                                            color: AppColor.yellow,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'Actions',
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
                                controller.isLoading2 == true
                                    ? Loading()
                                    : controller.allVendorList.isEmpty
                                    ? MessageBox(message: 'No data found')
                                    : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  clipBehavior: Clip.hardEdge,
                                  itemCount: controller.allVendorList.length,
                                  itemBuilder: (context, index) {
                                    final data = controller.allVendorList[index];
                                    return VendorCard(
                                      name: data.name.toString(),
                                      phone: data.phone.toString(),
                                      address: data.address.toString(),
                                    );
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
    },);
  }
}
