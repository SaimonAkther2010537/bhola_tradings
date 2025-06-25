import 'dart:async';



import '../../../core/constant/api_end_points.dart';
import '../../../core/networking/base_client.dart';
import '../../../domain/entities/lot_entity/buy_lot_entity.dart';
import '../../../domain/entities/lot_entity/create_lot_entity.dart';
import '../../../domain/entities/lot_entity/get_all_lot_entity.dart';
import '../../../domain/repositories/lot_repo/lot_repository.dart';
import '../../data_source/local_data_storage/auth_data_storage/local_data_storage_repository.dart';
import '../../dto_model/lot_dto/buy_dto_model.dart';
import '../../dto_model/lot_dto/lot_dto_model.dart';
import '../../models/lot_model/buy_lot_model.dart';
import '../../models/lot_model/create_lot_model.dart';
import '../../models/lot_model/get_all_lot_model.dart';

class LotRepositoryImpl implements LotRepository {
  final LocalDataStorageRepository localDataStorageRepository;

  LotRepositoryImpl({required this.localDataStorageRepository});

  ///========================== Buy Lot ==============================================
  @override
  Future<BuyLotEntity> buyLot({required BuyDtoModel buyDtoModel}) async {
    final completer = Completer<BuyLotEntity>();

    try {
      await BaseClient().safeApiCall(
        ApiEndPoints().createLotUrl,
        RequestType.post,
        headers: {"Authorization": "Bearer ${localDataStorageRepository.accessToken}"},
        data: buyDtoModel.toJson(),
        onSuccess: (response) {
          if (response.statusCode == 201) {
            completer.complete(BuyLotModel.fromJson(response.data).toEntity());
          } else {
            completer.completeError(BuyLotModel.fromJson(response.data).toEntity());
          }
        },
        onError: (error) {
          print(error.response);
          completer.completeError(BuyLotModel.fromJson(error.response!.data).toEntity());
        },
      );
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

  ///========================== Get All Lot ==============================================
  @override
  Future<List<GetAllLotEntity>> getAllLot() async {
    final completer = Completer<List<GetAllLotEntity>>();

    try {
      await BaseClient().safeApiCall(
        ApiEndPoints().getAllLotUrl,
        RequestType.get,
        headers: {"Authorization": "Bearer ${localDataStorageRepository.accessToken}"},
        onSuccess: (response) {
          if (response.statusCode == 200) {
            final getAllLotModel = GetAllLotModel.fromJson(response.data);
            completer.complete(getAllLotModel.toEntityList());
          } else {
            completer.completeError(response.data['message']);
          }
        },
        onError: (e) {
          completer.completeError(e);
        },
      );
    } catch (error) {
      return completer.future;
    }
    return completer.future;
  }

  ///========================== Sale Lot ==============================================
  @override
  Future<CreateLotEntity> saleLot({required LotDtoModel lotDtoModel}) async {
    final completer = Completer<CreateLotEntity>();

    try {
      await BaseClient().safeApiCall(
        ApiEndPoints().sellLotUrl,
        RequestType.post,
        headers: {"Authorization": "Bearer ${localDataStorageRepository.accessToken}"},
        data: lotDtoModel.toJson(),
        onSuccess: (response) {
          if (response.statusCode == 200) {
            completer.complete(CreateLotModel.fromJson(response.data).toEntity());
          } else {
            completer.completeError(CreateLotModel.fromJson(response.data).toEntity());
          }
        },
        onError: (error) {
          print(error.response);
          completer.completeError(CreateLotModel.fromJson(error.response!.data).toEntity());
        },
      );
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }
}
