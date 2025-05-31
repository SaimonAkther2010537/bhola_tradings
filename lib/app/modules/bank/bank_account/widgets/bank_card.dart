
import 'package:flutter/material.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../../../../core/widgets/buttons/icon_text_button.dart';
import '../../../../core/widgets/custom_row_text.dart';


class BankCard extends StatelessWidget {

  final VoidCallback editTap;
  final VoidCallback viewTap;
  const BankCard({super.key, required this.editTap, required this.viewTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(10),
      color: AppColor.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRowText(
                  title: 'ID: ',
                  subTitle: "1200",
                  subTitleSize: 14,
                  titleSize: 14,
                ),
                Text('Bank: SIBL', style: AppText().headerLine3),

                Row(
                  children: [

                    IconTextButton(
                      height: 35,
                      padding: 5,
                      icon: RIcon.Pen_New_Round,
                      label: "Edit",
                      labelTextColor: AppColor.primaryGreen,
                      onClick: editTap,
                      iconColor: AppColor.primaryGreen,
                      backgroundColor: AppColor.white,

                      labelTextStyle: AppText().bodyLarge.copyWith(
                        color: AppColor.primaryGreen,
                      ),
                    ),
                    const SizedBox(width: 15),


                    IconTextButton(
                      height: 35,
                      padding: 5,
                      icon: RIcon.Paperclip_Rounded,
                      label: "View",
                      labelTextColor: AppColor.yellow,
                      onClick: viewTap,
                      backgroundColor: AppColor.white,
                      labelTextStyle: AppText().bodyLarge.copyWith(
                        color: AppColor.yellow,
                      ),
                    ),
                    const SizedBox(width: 15),
                    IconTextButton(
                      height: 35,
                      padding: 5,
                      icon: RIcon.Trash_Bin_2,
                      iconColor: AppColor.red,
                      label: "Delete",
                      labelTextColor: AppColor.red,
                      onClick: () {},

                      backgroundColor: AppColor.white,

                      labelTextStyle: AppText().bodyLarge.copyWith(
                        color: AppColor.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
            const SizedBox(height: 20),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomRowText(
                      title: 'Created At: ',
                      subTitle: "12-4-2023",
                      isSubTitleBold: true,
                    ),
                    const SizedBox(height: 10),

                    CustomRowText(
                      title: 'Updated At: ',
                      subTitle: "12-4-2023",
                      isSubTitleBold: true,
                    ),
                    const SizedBox(height: 10),

                    CustomRowText(
                      title: 'Type: ',
                      subTitle: "Deposit",
                      subTitleColor: AppColor.deepGreen,
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    CustomRowText(
                      title: 'Total Amount: ',
                      subTitle: "300000",
                      isSubTitleBold: true,
                    ),
                    const SizedBox(height: 10),

                    CustomRowText(
                      title: 'Deposit Amount: ',
                      subTitle: "-7000",
                      subTitleColor: AppColor.red,
                      isSubTitleBold: true,
                    ),
                    const SizedBox(height: 10),

                    CustomRowText(
                      title: 'Branch:',
                      subTitle: "Bhola",
                      isSubTitleBold: true,
                    ),
                  ],
                ),
                CustomRowText(
                  title: 'Nots:',
                  subTitle: "Bhola Trading Bhola",
                  subTitleSize: 14,
                  isSubTitleBold: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
