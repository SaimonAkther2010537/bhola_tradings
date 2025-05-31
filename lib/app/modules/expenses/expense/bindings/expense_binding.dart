import 'package:get/get.dart';

import '../../expense_type/controllers/expense_type_controller.dart';
import '../../product_expense/controllers/product_expense_controller.dart';
import '../controllers/expense_controller.dart';

class ExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpenseController>(
      () => ExpenseController(),
    );
    Get.lazyPut<ProductExpenseController>(
          () => ProductExpenseController(),
    );
    Get.lazyPut<ExpenseTypeController>(
          () => ExpenseTypeController(),
    );
  }
}
