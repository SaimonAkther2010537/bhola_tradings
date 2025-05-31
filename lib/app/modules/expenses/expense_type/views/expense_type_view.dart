import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/widgets/buttons/rouded_action_button.dart';
import '../../expense/controllers/expense_controller.dart';
import '../controllers/expense_type_controller.dart';
import '../widgets/add_expense_type_popup.dart';
import '../widgets/expense_type_card.dart';

class ExpenseTypeView extends GetView<ExpenseTypeController> {
  const ExpenseTypeView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final expenseController = Get.find<ExpenseController>();

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
                                "Expense Type",
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
                                Get.dialog(AddExpenseTypePopup());
                              },
                              label: 'Add Expense Type',
                            ),
                          ),

                          SizedBox(width: 10),

                          SizedBox(
                            width: size.width * 0.12,
                            height: size.height * 0.045,
                            child: RoundedActionButton(
                              onClick: () {
                                expenseController.expenseType.value = '';
                              },
                              label: 'Back',
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 40),

                      GridView.builder(
                        itemCount: controller.expenseTypeItem.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 4,
                        ),
                        itemBuilder: (context, index) {
                          return ExpenseTypeCard(
                            expenseTypeName: controller.expenseTypeItem[index]["name"]!,
                          );
                        },
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
