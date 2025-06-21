

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:r_icon_pro/r_icon_pro.dart';

import '../../../core/theme/app_color_config.dart';
import '../../../core/theme/text_config.dart';
import '../../../domain/services/auth_service.dart';


class AccountDropdown extends StatefulWidget {
  const AccountDropdown({super.key});

  @override
  State<AccountDropdown> createState() => _AccountDropdownState();
}

class _AccountDropdownState extends State<AccountDropdown> {
  bool _isOpen = false;
  final GlobalKey _key = GlobalKey();
  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      onTap: _toggleDropdown,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.grey.shade200,
                child: Icon(
                  Icons.person,
                  color: Colors.grey.shade800,
                  size: 18,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _toggleDropdown() {
    if (_isOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isOpen = true);
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isOpen = false);
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    final authService = Get.find<AuthService>();

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: _closeDropdown,
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              left: offset.dx - 180 + size.width,
              top: offset.dy + size.height + 8,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(12),
                color: AppColor.white,
                shadowColor: AppColor.yellow.withOpacity(0.2),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColor.yellow.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildDropdownItem(
                        icon: RIcon.User,
                        title: 'My Account',
                        onTap: () {
                          _closeDropdown();
                          // Navigate to account page
                        },
                      ),
                      _buildDivider(),
                      _buildDropdownItem(
                        icon: RIcon.Logout_2,
                        title: 'Logout',
                        onTap: () {
                          _closeDropdown();
                          authService.userLogout();
                          // Get.toNamed(Routes.LOGIN);
                        },
                        isDestructive: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: isDestructive ? Colors.red : AppColor.primaryBlack,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: AppText().bodyMediumBold.copyWith(
                  color: isDestructive ? Colors.red : AppColor.primaryBlack,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      color: AppColor.yellow.withOpacity(0.1),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }
}