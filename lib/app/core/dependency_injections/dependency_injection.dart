
import 'package:get/get.dart';

import '../../data/data_source/local_data_storage/auth_data_storage/local_data_storage_repository_impl.dart';
import '../../data/repositoriies/auth_repo_impl/auth_repo_impl.dart';
import '../../data/repositoriies/entity_repo_impl/entity_repo_impl.dart';
import '../../data/repositoriies/lot_repo_impl/lot_repository_impl.dart';
import '../../data/repositoriies/product_repo_impl/product_repo_impl.dart';
import '../../domain/services/auth_service.dart';
import '../../domain/services/entity_service.dart';
import '../../domain/services/lot_service.dart';
import '../../domain/services/product_service.dart';

abstract class DependencyInjection {
  static void init() {


    /// Repo Injection
    Get.put(AuthRepositoryImpl());
    Get.put(LocalDataStorageRepositoryImpl());

    Get.put(AuthService(authRepository: Get.find<AuthRepositoryImpl>(), localDataStorageRepository: LocalDataStorageRepositoryImpl()));

    Get.put(EntityRepoImpl(localDataStorageRepository: Get.find<LocalDataStorageRepositoryImpl>()));
    Get.put(EntityService(entityRepository: Get.find<EntityRepoImpl>()));

    Get.put(ProductRepoImpl(localDataStorageRepository: Get.find<LocalDataStorageRepositoryImpl>()));
    Get.put(ProductService(productRepository: Get.find<ProductRepoImpl>()));


    Get.put(LotRepositoryImpl(localDataStorageRepository: Get.find<LocalDataStorageRepositoryImpl>()));
    Get.put(LotService(lotRepository: Get.find<LotRepositoryImpl>()));




  }
}
