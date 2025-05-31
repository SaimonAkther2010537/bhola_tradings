import '../../entities/product_entity/get_all_product_entity.dart';

abstract class ProductRepository {

  Future<List<GetAllProductEntity>> getAllProduct();

}