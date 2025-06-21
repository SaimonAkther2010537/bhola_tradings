import 'package:get/get.dart';

import '../entities/product_entity/create_product_entity.dart';
import '../entities/product_entity/get_all_product_entity.dart';
import '../repositories/product_repo/product_repository.dart';

class ProductService extends GetxService {

  final ProductRepository productRepository;
  ProductService({required this.productRepository});

  ///================================= Get All Product  ==================================================
  Future<List<GetAllProductEntity>> getAllProduct() async {
    return productRepository.getAllProduct();
  }

  ///================================= Create Product  ==================================================
  Future<CreateProductEntity> createProduct({required String productName}) async {
    return productRepository.createProduct(productName: productName);
  }



}
