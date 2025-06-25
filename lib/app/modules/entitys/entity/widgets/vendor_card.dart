import 'package:bhola_tradings/app/modules/entitys/entity/widgets/pay_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../../core/theme/app_color_config.dart';
import '../../../../core/theme/text_config.dart';
import '../controllers/entity_controller.dart';

class VendorCard extends StatelessWidget {
  final String name;
  final String phone;
  final String address;
  final String amount;

  const VendorCard({
    super.key,
    required this.name,
    required this.phone,
    required this.address, required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<EntityController>();
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                      controller.entity.value = controller.entityDetails;
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      child: Text(
                        name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppText().headerLine6Light.copyWith(
                          color: AppColor.primaryBlack,
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
              phone,
              style: AppText().headerLine6Light.copyWith(
                color: AppColor.primaryBlack,
              ),
            ),
          ),
          Expanded(
            child: Text(
              amount,
              style: AppText().headerLine6Light,
            ),
          ),
          Expanded(
            child: Text(
              address,
              style: AppText().headerLine6Light.copyWith(
                color: AppColor.primaryBlack,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed:
                  double.parse('0'.replaceAll(',', '')) > 0
                      ? null
                      : () {
                    Get.dialog(PayPopup());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.yellow,
                    disabledBackgroundColor: AppColor.yellow.withOpacity(0.6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Pay',
                    style: AppText().bodyMediumBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
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
  }
}
