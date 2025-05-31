
import 'package:get/get.dart';

import '../../../data/data_source/local_data_storage/auth_data_storage/local_data_storage_repository_impl.dart';
import '../../../domain/services/auth_service.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(authService: Get.find<AuthService>(), localDataStorageRepository: Get.find<LocalDataStorageRepositoryImpl>()));
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
