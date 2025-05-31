import 'package:get/get.dart';

import '../../expense/controllers/expense_controller.dart';
import '../controllers/expense_type_controller.dart';

class ExpenseTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpenseTypeController>(
      () => ExpenseTypeController(),
    );
    Get.lazyPut<ExpenseController>(
          () => ExpenseController(),
    );
  }
}
