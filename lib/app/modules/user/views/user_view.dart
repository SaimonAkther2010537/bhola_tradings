import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../core/theme/app_color_config.dart';
import '../../../core/theme/text_config.dart';
import '../../../core/widgets/buttons/rouded_action_button.dart';
import '../controllers/user_controller.dart';
import '../widgets/add_user_popup.dart';

class UserView extends GetView<UserController> {
  const UserView({super.key});
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
              Card(
                color: AppColor.white,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                "All User",
                                style: AppText().headerLine3,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 180,
                            height: 40,
                            child: RoundedActionButton(
                              label: 'Add User',
                              onClick: () {
                                Get.dialog(AddUserPopup());
                              },
                            ),
                          ),
                        ],
                      ),


                      SizedBox(height: 20),

                      ///********************************* User Data Table *********************************
                      Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ///********************************* Tab Bar Headings *********************************
                                Expanded(child: Text('Name', style: AppText().headerLine6.copyWith(color: AppColor.yellow))),
                                Expanded(child: Text('Role', style: AppText().headerLine6.copyWith(color: AppColor.yellow))),
                                Expanded(child: Text('Phone', style: AppText().headerLine6.copyWith(color: AppColor.yellow))),
                                Expanded(child: Text('Email', style: AppText().headerLine6.copyWith(color: AppColor.yellow))),
                                Expanded(child: Text('Total Entry', style: AppText().headerLine6.copyWith(color: AppColor.yellow))),
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
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Material(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(10),
                                            clipBehavior: Clip.hardEdge,
                                            child: InkWell(
                                              hoverColor: AppColor.white,
                                              onTap: () {
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                                child: Text(customer['name'] ,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: AppText().headerLine6Light.copyWith(color: AppColor.primaryBlack)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(child: Text(customer['role'], style: AppText().headerLine6Light.copyWith(color: AppColor.primaryBlack))),
                                    Expanded(child: Text(customer['phone'], style: AppText().headerLine6Light.copyWith(color: AppColor.primaryBlack))),

                                    Expanded(child: Text(customer['email'], style: AppText().headerLine6Light.copyWith(color: AppColor.primaryBlack))),
                                    Expanded(child: Text(customer['total'], style: AppText().headerLine6Light.copyWith(color: AppColor.primaryBlack))),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                            icon: Icon(RIcon.Pen_New_Round, color: AppColor.primaryGreen),
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
