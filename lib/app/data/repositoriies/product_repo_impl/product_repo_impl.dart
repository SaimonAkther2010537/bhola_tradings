import 'dart:async';
import '../../../core/constant/api_end_points.dart';
import '../../../core/networking/base_client.dart';
import '../../../domain/entities/product_entity/get_all_product_entity.dart';
import '../../../domain/repositories/product_repo/product_repository.dart';
import '../../data_source/local_data_storage/auth_data_storage/local_data_storage_repository.dart';
import '../../models/product_model/get_all_product_model.dart';

class ProductRepoImpl implements ProductRepository {

  final LocalDataStorageRepository localDataStorageRepository;
  ProductRepoImpl({required this.localDataStorageRepository});


  ///--------------------------- Get All Product ----------------------------------
  @override
  Future<List<GetAllProductEntity>> getAllProduct() async{
    final completer = Completer<List<GetAllProductEntity>>();

    try {
      await BaseClient().safeApiCall(
        ApiEndPoints().getProductUrl,
        RequestType.get,
        headers: {"Authorization": "Bearer ${localDataStorageRepository.accessToken}"},
        onSuccess: (response) {
          if (response.statusCode == 200) {
            // completer.complete((GetAllCustomerModel.fromJson(response.data).map((e) => e.toEntity()).toList()));
            completer.complete((response.data as List<dynamic>).map((e) => GetAllProductModel.fromJson(e).toEntity()).toList());
          } else {
            completer.completeError(response.data['message']);
          }
        },
        onError: (e) {
          completer.completeError(e);
        },
      );
    } catch (error) {}

    return completer.future;
  }



}
