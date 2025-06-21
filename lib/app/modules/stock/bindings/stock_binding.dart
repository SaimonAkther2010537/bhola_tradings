import 'package:get/get.dart';

import '../../../domain/services/product_service.dart';
import '../controllers/stock_controller.dart';

class StockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StockController>(
      () => StockController(productService: Get.find<ProductService>()),
    );
  }
}
