import 'package:get/get.dart';

import '../../data/dto_model/entity_dto/create_customer_dto_model.dart';
import '../../data/dto_model/entity_dto/create_vendor_dto_model.dart';
import '../entities/entity/create_customer_entity.dart';
import '../entities/entity/create_vendor_entity.dart';
import '../entities/entity/get_all_customer_entity.dart';
import '../entities/entity/get_all_vendor.dart';
import '../repositories/entity_repo/entity_repository.dart';

class EntityService extends GetxService {
  final EntityRepository entityRepository;

  EntityService({required this.entityRepository});


  ///================================= GetAllCustomer  ==================================================
  Future<List<GetAllCustomerEntity>> getAllCustomer() async {
    return entityRepository.getAllCustomer();
  }

  ///================================= GetAllVendor  ==================================================
  Future<List<GetAllVendor>> getAllVendor() async {
    return entityRepository.getAllVendor();
  }

  /// ================================================== Create Customer ==================================================
  Future<CreateCustomerEntity> createCustomer({required CreateCustomerDtoModel createCustomerDtoModel}) async{
    return entityRepository.createCustomer(createCustomerDtoModel: createCustomerDtoModel);
  }

  /// ================================================== Create Vendor ==================================================
  Future<CreateVendorEntity> createVendor({required CreateVendorDtoModel createVendorDtoModel}) async{
    return entityRepository.createVendor(createVendorDtoModel: createVendorDtoModel);
  }


}
