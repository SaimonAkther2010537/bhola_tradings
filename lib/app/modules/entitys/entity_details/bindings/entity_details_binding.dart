import 'package:get/get.dart';

import '../controllers/entity_details_controller.dart';

class EntityDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EntityDetailsController>(
      () => EntityDetailsController(),
    );
  }
}
