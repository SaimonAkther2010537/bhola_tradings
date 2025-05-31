
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/utility/validator.dart';
import '../../../../core/widgets/buttons/custom_icon_button.dart';
import '../../../../core/widgets/buttons/rouded_action_button.dart';
import '../../../../core/widgets/input_widgets/drop-down_input_field.dart';
import '../../../../core/widgets/input_widgets/multi_line_input_field.dart';
import '../../../../core/widgets/input_widgets/simple_input_field.dart';
import '../controllers/entity_controller.dart';

class AddEntityPopup extends StatelessWidget {
  const AddEntityPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final controller = Get.find<EntityController>();
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: AppColor.white,
      child: SizedBox(
        width: size.width * 0.4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Advance Entity",
                          style: AppText().headerLine3.copyWith(
                            color: AppColor.yellow,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),

                    CustomIconButton(
                      icon: RIcon.Close_Square,
                      onTap: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Flexible(
                      child: DropDownInputField(
                        controller: controller.userTypeController,
                        hintText: 'Select',
                        needValidation: true,
                        errorMessage: 'Please select user type',
                        fieldTitle: 'Entity Type',
                        needTitle: true,
                        items: ["Customer", "Vendor",],
                        titleStyle: AppText().bodyMediumBold,

                      ),
                    ),

                    SizedBox(width: 10),

                    Flexible(
                      child: SimpleInputField(
                        controller: controller.nameController,
                        hintText: 'Enter Customer name',
                        errorMessage: 'Please enter a name',
                        fieldTitle: 'Customer Name',
                        needTitle: true,
                        needValidation: true,
                        validatorClass: Validator().validateName,
                        titleStyle: AppText().bodyMediumBold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    Flexible(
                      child: SimpleInputField(
                        controller: controller.phoneController,
                        hintText: 'Enter Phone Number',
                        errorMessage: 'errorMessage',
                        fieldTitle: 'Phone Number',
                        titleStyle: AppText().bodyMediumBold,
                        needTitle: true,
                        needValidation: true,
                      ),
                    ),

                    SizedBox(width: 10),

                    Flexible(
                      child: SimpleInputField(
                        controller: TextEditingController(),
                        hintText: 'Enter Year',
                        errorMessage: 'errorMessage',
                        fieldTitle: 'Year',
                        titleStyle: AppText().bodyMediumBold,
                        needValidation: false,
                        needTitle: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                MultiLineInputField(
                  controller: controller.addressController,
                  hintText: "Address",
                  fieldTitle: "Address",
                  numberOfLines: 3,
                  needTitle: true,
                ),

                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: RoundedActionButton(
                          onClick: () {
                            Get.back();
                          },
                          label: 'Cancel',
                          backgroundColor: Colors.white,
                          forGroundColor: AppColor.primaryBlack,
                          borderRadius: BorderRadius.circular(10),
                          textStyle: AppText().buttonMedium,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: RoundedActionButton(
                          onClick: () {
                            if (controller.formKey.currentState!.validate()) {
                              if(controller.userTypeController.text.trim() == 'Customer'){
                                controller.createCustomer(context: context);
                              }else{
                                controller.createVendor(context: context);
                              }
                            }
                          },
                          label: 'Add Entity',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
