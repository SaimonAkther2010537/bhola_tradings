import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_color_config.dart';

class CustomSnackBar {
  static void showCustomSuccessToast({
    required String title,
    required String message,
    Color? backgroundColor,
    Duration? duration,
  }) {
    _showOverlayToast(
      title: title,
      message: message,
      icon: Icons.check_circle,
      backgroundColor: backgroundColor ?? AppColor.primaryGreen,
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  static void showCustomErrorToast({
    required String title,
    required String message,
    Color? backgroundColor,
    Duration? duration,
  }) {
    _showOverlayToast(
      title: title,
      message: message,
      icon: Icons.error,
      backgroundColor: backgroundColor ?? AppColor.red,
      duration: duration ?? const Duration(seconds: 3),
    );
  }

  static void _showOverlayToast({
    required String title,
    required String message,
    required IconData icon,
    required Color backgroundColor,
    required Duration duration,
  }) {
    final overlay = Get.overlayContext;
    if (overlay == null) return;

    final overlayState = Overlay.of(overlay);

    final entry = OverlayEntry(
      builder: (context) => Positioned(
        top: 40,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 300),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.black26)],
            ),
            child: Row(
              children: [
                Icon(icon, color: Colors.white),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        message,
                        style: const TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlayState.insert(entry);
    Future.delayed(duration, () => entry.remove());
  }
}
