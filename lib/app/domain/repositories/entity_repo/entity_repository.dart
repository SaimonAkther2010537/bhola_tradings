import '../../../data/dto_model/entity_dto/create_customer_dto_model.dart';
import '../../../data/dto_model/entity_dto/create_vendor_dto_model.dart';
import '../../entities/entity/create_customer_entity.dart';
import '../../entities/entity/create_vendor_entity.dart';
import '../../entities/entity/get_all_customer_entity.dart';
import '../../entities/entity/get_all_vendor.dart';

abstract class EntityRepository {

  Future<List<GetAllCustomerEntity>> getAllCustomer();

  Future<List<GetAllVendor>> getAllVendor();

  Future<CreateCustomerEntity> createCustomer({required CreateCustomerDtoModel createCustomerDtoModel});

  Future<CreateVendorEntity> createVendor({required CreateVendorDtoModel createVendorDtoModel});


}

