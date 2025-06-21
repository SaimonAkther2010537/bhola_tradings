import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_color_config.dart';
import '../theme/text_config.dart';


class CustomTabBarController extends GetxController {
  var selectedTabIndex = 0.obs;

  void selectTab(int index) {
    selectedTabIndex.value = index;
  }
}

class CustomTabBar extends StatelessWidget {
  final List<Widget> tabViews;
  final bool showSearchBar;
  final Widget? searchBarWidget;

  const CustomTabBar({
    super.key,
    required this.tabViews,
    this.showSearchBar = false,
    this.searchBarWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomTabBarController>(
      init: CustomTabBarController(),
      global: false,
      builder: (controller) {
        return Column(
          children: [
            /// ========== Custom Tab Bar ==========
            Obx(() {
              return Container(
                height: 30,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColor.yellow, width: 2.5),
                ),
                child: Row(
                  children: [
                    _buildTab(controller, 0, "Today"),
                    _verticalDivider(),
                    _buildTab(controller, 1, "Yesterday"),
                    _verticalDivider(),
                    _buildTab(controller, 2, "Last Week"),
                    _verticalDivider(),
                    _buildTab(controller, 3, "Last Month"),
                    _verticalDivider(),
                    _buildTab(controller, 4, "Custom"),
                  ],
                ),
              );
            }),

            const SizedBox(height: 10),

            /// ===================== Search Bar (If Enabled) =====================
            if (showSearchBar && searchBarWidget != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: searchBarWidget!,
              ),

            const SizedBox(height: 10),

            /// ===================== Tab Content =====================
            Obx(() {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: tabViews[controller.selectedTabIndex.value],
              );
            }),
          ],
        );
      },
    );
  }

  /// ====== Custom Tab Item ======
  Widget _buildTab(CustomTabBarController controller, int index, String text) {
    bool isSelected = controller.selectedTabIndex.value == index;

    return Expanded(
      child: InkWell(
        onTap: () => controller.selectTab(index),
        child: Material(
          clipBehavior: Clip.hardEdge,
          color: isSelected ? AppColor.yellow : Colors.transparent,
          child: Center(
            child: Text(
              text,
              style: AppText().buttonLarge.copyWith(
                color: isSelected ? AppColor.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// ====== Vertical Divider (Fixed Height) ======
  Widget _verticalDivider() {
    return VerticalDivider(
      width: 1.5,
      thickness: 2.5,
      color: AppColor.yellow,
    );
  }
}
