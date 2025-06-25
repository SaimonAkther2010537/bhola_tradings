
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bank/bank_account/views/bank_account_view.dart';
import '../../buy_and_sale/buy/views/buy_view.dart';
import '../../buy_and_sale/sale/controllers/sale_controller.dart';
import '../../dashboard/views/dashboard_view.dart';
import '../../debit_credit/debitors_or_creditors/views/debitors_or_creditors_view.dart';
import '../../entitys/entity/views/entity_view.dart';
import '../../expenses/expense/views/expense_view.dart';
import '../../stock/views/stock_view.dart';
import '../../user/views/user_view.dart';

class HomeController extends GetxController {



  final saleController = Get.find<SaleController>();


  @override
  void onInit() {
    saleController.getAllLot();
    super.onInit();
  }

  final isDrawerOpen = true.obs;
  final selectedPageIndex = 0.obs;
  final selectedDrawerItemIndex = 0.obs;

  final List<Widget> pages = [
    const DashboardView(),
    const BuyView(),
    const ExpenseView(),
    const StockView(),
    const EntityView(),
    const BankAccountView(),
    const DebitorsOrCreditorsView(),
    const UserView(),
  ];

  final List<String> pageTitles = [
    "Dashboard",
    "Buy/Sale",
    "Expense",
    "Stock",
    "Entity",
    "Bank Account",
    "Debitors/Creditors",
    "User",
  ];

  void toggleDrawer() => isDrawerOpen.value = !isDrawerOpen.value;

  void selectPage(int index) {
    selectedPageIndex.value = index;
    selectedDrawerItemIndex.value = index;
  }

}