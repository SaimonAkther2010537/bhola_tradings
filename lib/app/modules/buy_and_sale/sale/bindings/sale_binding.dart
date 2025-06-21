import 'package:get/get.dart';

import '../../../../domain/services/lot_service.dart';
import '../../../entitys/entity/controllers/entity_controller.dart';
import '../../../stock/controllers/stock_controller.dart';
import '../../buy/controllers/buy_controller.dart';
import '../controllers/sale_controller.dart';

class SaleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaleController>(
      () => SaleController(lotService: Get.find<LotService>(),entityController: Get.find<EntityController>()),
    );
    Get.lazyPut<BuyController>(
          () => BuyController(entityController: Get.find<EntityController>(),stockController: Get.find<StockController>(),lotService: Get.find<LotService>()),
    );
  }
}
