import 'package:get/get.dart';

import '../controllers/debitors_or_creditors_controller.dart';

class DebitorsOrCreditorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DebitorsOrCreditorsController>(
      () => DebitorsOrCreditorsController(),
    );
  }
}
