import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {



  ///==================== Controller ===================

  var searchController = TextEditingController();

  /// ================= Tab Management =================
  RxInt selectedTabIndex = 0.obs;

  final List<String> tabs = [
    'Today',
    'Yesterday',
    'Last Week',
    'Last Month',
    'Custom',
  ];

  /// ================= Tab Selection Function =================
  void selectTab(int index) {
    selectedTabIndex.value = index;
  }

  /// ================= Date Picker =================
  Future<void> pickDateRange() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: Get.context!,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      // Handle date range selection
      print("Selected range: ${picked.start} - ${picked.end}");
    }
  }

  /// ================= Dynamic Tab Content =================
  Widget getTabContent() {
    switch (selectedTabIndex.value) {
      case 0:
        return _buildTabContent("Today's Data");
      case 1:
        return _buildTabContent("Yesterday's Data");
      case 2:
        return _buildTabContent("Last Week's Data");
      case 3:
        return _buildTabContent("Last Month's Data");
      case 4:
        return _buildTabContent("Custom Date Data");
      default:
        return _buildTabContent("No Data Available");
    }
  }

  Widget _buildTabContent(String text) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

}
