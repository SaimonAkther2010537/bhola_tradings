import 'dart:async';


import '../../../core/constant/api_end_points.dart';
import '../../../core/networking/base_client.dart';
import '../../../domain/entities/product_entity/create_product_entity.dart';
import '../../../domain/entities/product_entity/get_all_product_entity.dart';
import '../../../domain/repositories/product_repo/product_repository.dart';
import '../../data_source/local_data_storage/auth_data_storage/local_data_storage_repository.dart';
import '../../models/product_model/create_product_model.dart';
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

  @override
  Future<CreateProductEntity> createProduct({required String productName}) async{
    final completer = Completer<CreateProductEntity>();

    try {
      await BaseClient().safeApiCall(
        ApiEndPoints().createProductUrl,
        RequestType.post,
        headers: {"Authorization": "Bearer ${localDataStorageRepository.accessToken}"},
        data: {
          'name' : productName
        },
        onSuccess: (response) {
          if (response.statusCode == 201) {
            completer.complete(CreateProductModel.fromJson(response.data).toEntity());
          } else {
            completer.completeError(CreateProductModel.fromJson(response.data).toEntity());
          }
        },
        onError: (error) {
          print(error.response);
          completer.completeError(CreateProductModel.fromJson(error.response!.data).toEntity());
        },
      );
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }



}
