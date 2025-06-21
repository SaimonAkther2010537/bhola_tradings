
import 'package:get/get.dart';

import '../../../../domain/services/lot_service.dart';
import '../../../entitys/entity/controllers/entity_controller.dart';
import '../../../stock/controllers/stock_controller.dart';
import '../../sale/controllers/sale_controller.dart';
import '../controllers/buy_controller.dart';

class BuyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuyController>(
      () => BuyController(
        entityController: Get.find<EntityController>(),
        stockController: Get.find<StockController>(),
        lotService: Get.find<LotService>(),
      ),
    );

    Get.lazyPut<SaleController>(() => SaleController(entityController: Get.find<EntityController>(), lotService: Get.find<LotService>()));
  }
}
