import 'package:get/get.dart';

import '../../buy/controllers/buy_controller.dart';
import '../controllers/sale_controller.dart';

class SaleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaleController>(
      () => SaleController(),
    );
    Get.lazyPut<BuyController>(
          () => BuyController(),
    );
  }
}
