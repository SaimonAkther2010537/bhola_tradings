import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../../data/dto_model/lot_dto/buy_dto_model.dart';
import '../../data/dto_model/lot_dto/lot_dto_model.dart';
import '../entities/lot_entity/buy_lot_entity.dart';
import '../entities/lot_entity/create_lot_entity.dart';
import '../entities/lot_entity/get_all_lot_entity.dart';
import '../repositories/lot_repo/lot_repository.dart';

class LotService extends GetxService {
  final LotRepository lotRepository;
  LotService({required this.lotRepository});


  ///================================= Buy Lot  ==================================================
  Future<BuyLotEntity> buyLot({required BuyDtoModel buyDtoModel}) async {
    return lotRepository.buyLot(buyDtoModel: buyDtoModel);
  }


  ///================================= Get All LOTS ==================================================
  Future<List<GetAllLotEntity>> getAllLot() async {
    return lotRepository.getAllLot();
  }


  ///================================= Sale Lot  ==================================================
  Future<CreateLotEntity> saleLot({required LotDtoModel lotDtoModel}) async {
    return lotRepository.saleLot(lotDtoModel: lotDtoModel);
  }







}
