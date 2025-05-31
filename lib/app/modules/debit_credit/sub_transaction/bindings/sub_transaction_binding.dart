import 'package:get/get.dart';

import '../controllers/sub_transaction_controller.dart';

class SubTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubTransactionController>(
      () => SubTransactionController(),
    );
  }
}
