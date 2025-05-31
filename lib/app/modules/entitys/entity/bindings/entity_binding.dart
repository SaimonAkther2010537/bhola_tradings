import 'package:get/get.dart';

import '../../../../domain/services/entity_service.dart';
import '../controllers/entity_controller.dart';

class EntityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntityController>(
      () => EntityController(entityService: Get.find<EntityService>()),
    );
  }
}
