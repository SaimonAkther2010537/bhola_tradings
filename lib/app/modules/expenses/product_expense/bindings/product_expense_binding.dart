import 'package:get/get.dart';

import '../../expense/controllers/expense_controller.dart';
import '../controllers/product_expense_controller.dart';

class ProductExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductExpenseController>(
      () => ProductExpenseController(),
    );
    Get.lazyPut<ExpenseController>(
          () => ExpenseController(),
    );
  }
}
