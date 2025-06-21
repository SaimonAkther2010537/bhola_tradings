import '../../../data/dto_model/lot_dto/buy_dto_model.dart';
import '../../../data/dto_model/lot_dto/lot_dto_model.dart';
import '../../entities/lot_entity/buy_lot_entity.dart';
import '../../entities/lot_entity/create_lot_entity.dart';
import '../../entities/lot_entity/get_all_lot_entity.dart';

abstract class LotRepository {
  Future<List<GetAllLotEntity>> getAllLot();

  Future<BuyLotEntity> buyLot({required BuyDtoModel buyDtoModel});

  Future<CreateLotEntity> saleLot({required LotDtoModel lotDtoModel});
}
