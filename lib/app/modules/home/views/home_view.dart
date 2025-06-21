import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';
import '../../../core/theme/app_assets.dart';
import '../../../core/theme/app_color_config.dart';
import '../controllers/home_controller.dart';
import '../widgets/account_dropdown.dart';
import '../widgets/custom_drawer_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        clipBehavior: Clip.hardEdge,
        automaticallyImplyLeading: false,
        toolbarHeight: 75,
        elevation: 3,
        shadowColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              return Row(
                children: [
                  AnimatedRotation(
                    turns: controller.isDrawerOpen.value ? 0 : 0.5,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: IconButton(
                      onPressed: controller.toggleDrawer,
                      icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: RotationTransition(
                              turns: animation,
                              child: child,
                            ),
                          );
                        },
                        child: Icon(
                          Icons.menu_open,
                          key: ValueKey(controller.isDrawerOpen.value),
                          color: AppColor.yellow,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: size.width * 0.13,
                    child: Text(
                      controller.pageTitles[controller.selectedPageIndex.value],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: AppColor.yellow, fontSize: 18),
                    ),
                  ),
                ],
              );
            }),
            Image.asset(
              AppAssets.bholaTrading,
              fit: BoxFit.contain,
              height: 60,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 10),
            //   child: Material(
            //     borderRadius: BorderRadius.circular(12),
            //     color: Colors.transparent,
            //     clipBehavior: Clip.hardEdge,
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Icon(RIcon.User, size: 16, color: AppColor.yellow),
            //         const SizedBox(width: 8),
            //         Text(
            //           controller.localDataStorageRepository.userName,
            //           overflow: TextOverflow.ellipsis,
            //           style: AppText().bodyMedium.copyWith(
            //             color: AppColor.yellow,
            //             fontSize: 15,
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //         SizedBox(width: 20),
            //         IconButton(
            //           onPressed: () {
            //             controller.authService.userLogout();
            //           },
            //           icon: Icon(RIcon.Login_2, size: 20, color: AppColor.yellow),
            //         ),
            //         // const SizedBox(width: 6),
            //         // Icon(
            //         //   Icons.keyboard_arrow_down_rounded,
            //         //   size: 20,
            //         //   color: AppColor.yellow,
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(width: 8),
            const AccountDropdown(),

          ],
        ),
      ),
      body: Row(
        children: [
          Obx(() {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: controller.isDrawerOpen.value ? 250 : 0,
              height: double.infinity,
              color: AppColor.yellow,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CustomDrawerItem(
                    title: "Dashboard",
                    icon: RIcon.Widget_5,
                    onTap: () => controller.selectPage(0),
                    isSelected: controller.selectedDrawerItemIndex.value == 0,
                  ),
                  CustomDrawerItem(
                    title: "Buy/Sale",
                    icon: RIcon.Graph_New_Up,
                    onTap: () => controller.selectPage(1),
                    isSelected: controller.selectedDrawerItemIndex.value == 1,
                  ),
                  CustomDrawerItem(
                    title: "Expense",
                    icon: Icons.money_off_csred_sharp,
                    onTap: () => controller.selectPage(2),
                    isSelected: controller.selectedDrawerItemIndex.value == 2,
                  ),
                  CustomDrawerItem(
                    title: "Stock",
                    icon: RIcon.Feed,
                    onTap: () => controller.selectPage(3),
                    isSelected: controller.selectedDrawerItemIndex.value == 3,
                  ),
                  CustomDrawerItem(
                    title: "Entity",
                    icon: RIcon.User_Plus,
                    onTap: () => controller.selectPage(4),
                    isSelected: controller.selectedDrawerItemIndex.value == 4,
                  ),
                  CustomDrawerItem(
                    title: "Bank Account",
                    icon: RIcon.Smart_Home,
                    onTap: () => controller.selectPage(5),
                    isSelected: controller.selectedDrawerItemIndex.value == 5,
                  ),
                  CustomDrawerItem(
                    title: "Debitors/Creditors",
                    icon: RIcon.Wallet,
                    onTap: () => controller.selectPage(6),
                    isSelected: controller.selectedDrawerItemIndex.value == 6,
                  ),
                  CustomDrawerItem(
                    title: "User",
                    icon: RIcon.Users_Group_Two_Rounded,
                    onTap: () => controller.selectPage(7),
                    isSelected: controller.selectedDrawerItemIndex.value == 7,
                  ),
                ],
              ),
            );
          }),
          Expanded(
            child: Obx(() {
              return controller.pages[controller.selectedPageIndex.value];
            }),
          ),
        ],
      ),
    );
  }
}
