

import 'dart:async';

import '../../../core/constant/api_end_points.dart';
import '../../../core/networking/base_client.dart';
import '../../../domain/entities/entity/create_customer_entity.dart';
import '../../../domain/entities/entity/create_vendor_entity.dart';
import '../../../domain/entities/entity/get_all_customer_entity.dart';
import '../../../domain/entities/entity/get_all_vendor.dart';
import '../../../domain/repositories/entity_repo/entity_repository.dart';
import '../../data_source/local_data_storage/auth_data_storage/local_data_storage_repository.dart';
import '../../dto_model/entity_dto/create_customer_dto_model.dart';
import '../../dto_model/entity_dto/create_vendor_dto_model.dart';
import '../../models/auth_model/logout_response_model.dart';
import '../../models/entity_model/create_customer_model.dart';
import '../../models/entity_model/create_vendor_model.dart';
import '../../models/entity_model/get_all_customer_model.dart';
import '../../models/entity_model/get_all_vendor.dart';

class EntityRepoImpl implements EntityRepository {
  final LocalDataStorageRepository localDataStorageRepository;

  EntityRepoImpl({required this.localDataStorageRepository});


  ///----------------------------------- Get All Customer ----------------------------------
  @override
  Future<List<GetAllCustomerEntity>> getAllCustomer() async{
    final completer = Completer<List<GetAllCustomerEntity>>();

    try {

      await BaseClient().safeApiCall(
        ApiEndPoints().getCustomerUrl,
        RequestType.get,
        headers: {"Authorization": "Bearer ${localDataStorageRepository.accessToken}"},
        onSuccess: (response) {
          if (response.statusCode == 200) {
            // completer.complete((GetAllCustomerModel.fromJson(response.data).map((e) => e.toEntity()).toList()));
            completer.complete((response.data as List<dynamic>).map((e) => GetAllCustomerModel.fromJson(e).toEntity()).toList());
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


  ///----------------------------------- Get All Vendor ----------------------------------


  @override
  Future<List<GetAllVendor>> getAllVendor() async{
    final completer = Completer<List<GetAllVendor>>();

    try {

      await BaseClient().safeApiCall(
        ApiEndPoints().getVendorUrl,
        RequestType.get,
        headers: {"Authorization": "Bearer ${localDataStorageRepository.accessToken}"},
        onSuccess: (response) {
          if (response.statusCode == 200) {
            // completer.complete((GetAllCustomerModel.fromJson(response.data).map((e) => e.toEntity()).toList()));
            completer.complete((response.data as List<dynamic>).map((e) => GetAllVendorModel.fromJson(e).toEntity()).toList());
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

  /// ----------------------------------- Create Customer ----------------------------------
  @override
  Future<CreateCustomerEntity> createCustomer({required CreateCustomerDtoModel createCustomerDtoModel}) async{
    final completer = Completer<CreateCustomerEntity>();

    try {
      await BaseClient().safeApiCall(
        ApiEndPoints().getCustomerUrl,
        RequestType.post,
        headers: {"Authorization": "Bearer ${localDataStorageRepository.accessToken}"},
        data: createCustomerDtoModel.toJson(),
        onSuccess: (response) {
          if (response.statusCode == 201) {
            completer.complete(CreateCustomerModel.fromJson(response.data).toEntity());
          } else {
            completer.completeError(CreateCustomerModel.fromJson(response.data).toEntity());
          }
        },
        onError: (error) {
          print(error.response);
          completer.completeError(CreateCustomerModel.fromJson(error.response!.data).toEntity());
        },
      );
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }


  /// ----------------------------------- Create Vendor ----------------------------------

  @override
  Future<CreateVendorEntity> createVendor({required CreateVendorDtoModel createVendorDtoModel}) async{
    final completer = Completer<CreateVendorEntity>();

    try {
      await BaseClient().safeApiCall(
        ApiEndPoints().getVendorUrl,
        RequestType.post,
        headers: {"Authorization": "Bearer ${localDataStorageRepository.accessToken}"},
        data: createVendorDtoModel.toJson(),
        onSuccess: (response) {
          if (response.statusCode == 201) {
            completer.complete(CreateVendorModel.fromJson(response.data).toEntity());
          } else {
            completer.completeError(CreateVendorModel.fromJson(response.data).toEntity());
          }
        },
        onError: (error) {
          print(error.response);
          completer.completeError(CreateVendorModel.fromJson(error.response!.data).toEntity());
        },
      );
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }




}

