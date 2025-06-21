
import 'package:get/get.dart';

import '../../../data/data_source/local_data_storage/auth_data_storage/local_data_storage_repository_impl.dart';
import '../../../domain/services/auth_service.dart';
import '../../../domain/services/entity_service.dart';
import '../../../domain/services/lot_service.dart';
import '../../../domain/services/product_service.dart';
import '../../bank/add_bank/controllers/add_bank_controller.dart';
import '../../bank/bank_account/controllers/bank_account_controller.dart';
import '../../bank/bank_details/controllers/bank_details_controller.dart';
import '../../buy_and_sale/buy/controllers/buy_controller.dart';
import '../../buy_and_sale/sale/controllers/sale_controller.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../../debit_credit/debitors_or_creditors/controllers/debitors_or_creditors_controller.dart';
import '../../debit_credit/sub_transaction/controllers/sub_transaction_controller.dart';
import '../../entitys/entity/controllers/entity_controller.dart';
import '../../entitys/entity_details/controllers/entity_details_controller.dart';
import '../../expenses/expense/controllers/expense_controller.dart';
import '../../expenses/expense_details/controllers/expense_details_controller.dart';
import '../../expenses/expense_type/controllers/expense_type_controller.dart';
import '../../expenses/product_expense/controllers/product_expense_controller.dart';
import '../../stock/controllers/stock_controller.dart';
import '../../user/controllers/user_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(localDataStorageRepository: Get.find<LocalDataStorageRepositoryImpl>(), authService: Get.find<AuthService>()));
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<StockController>(() => StockController(productService: Get.find<ProductService>()));
    Get.lazyPut<BankAccountController>(() => BankAccountController());
    Get.lazyPut<EntityController>(() => EntityController(entityService: Get.find<EntityService>()));
    Get.lazyPut<DebitorsOrCreditorsController>(() => DebitorsOrCreditorsController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<ExpenseController>(() => ExpenseController());
    Get.lazyPut<BuyController>(() => BuyController(entityController: Get.find<EntityController>(),stockController: Get.find<StockController>(),lotService: Get.find<LotService>()));
    Get.lazyPut<ProductExpenseController>(() => ProductExpenseController());
    Get.lazyPut<ExpenseTypeController>(() => ExpenseTypeController());
    Get.lazyPut<ExpenseDetailsController>(() => ExpenseDetailsController());
    Get.lazyPut<EntityDetailsController>(() => EntityDetailsController());
    Get.lazyPut<AddBankController>(() => AddBankController());
    Get.lazyPut<BankDetailsController>(() => BankDetailsController());
    Get.lazyPut<SubTransactionController>(() => SubTransactionController());
    Get.lazyPut<SaleController>(() => SaleController(entityController: Get.find<EntityController>(), lotService: Get.find<LotService>()));

  }
}
