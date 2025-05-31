import 'package:get/get.dart';

import '../modules/bank/add_bank/bindings/add_bank_binding.dart';
import '../modules/bank/add_bank/views/add_bank_view.dart';
import '../modules/bank/bank_account/bindings/bank_account_binding.dart';
import '../modules/bank/bank_account/views/bank_account_view.dart';
import '../modules/bank/bank_details/bindings/bank_details_binding.dart';
import '../modules/bank/bank_details/views/bank_details_view.dart';
import '../modules/buy_and_sale/buy/bindings/buy_binding.dart';
import '../modules/buy_and_sale/buy/views/buy_view.dart';
import '../modules/buy_and_sale/sale/bindings/sale_binding.dart';
import '../modules/buy_and_sale/sale/views/sale_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/debit_credit/debitors_or_creditors/bindings/debitors_or_creditors_binding.dart';
import '../modules/debit_credit/debitors_or_creditors/views/debitors_or_creditors_view.dart';
import '../modules/debit_credit/sub_transaction/bindings/sub_transaction_binding.dart';
import '../modules/debit_credit/sub_transaction/views/sub_transaction_view.dart';
import '../modules/entitys/entity/bindings/entity_binding.dart';
import '../modules/entitys/entity/views/entity_view.dart';
import '../modules/entitys/entity_details/bindings/entity_details_binding.dart';
import '../modules/entitys/entity_details/views/entity_details_view.dart';
import '../modules/expenses/expense/bindings/expense_binding.dart';
import '../modules/expenses/expense/views/expense_view.dart';
import '../modules/expenses/expense_details/bindings/expense_details_binding.dart';
import '../modules/expenses/expense_details/views/expense_details_view.dart';
import '../modules/expenses/expense_type/bindings/expense_type_binding.dart';
import '../modules/expenses/expense_type/views/expense_type_view.dart';
import '../modules/expenses/product_expense/bindings/product_expense_binding.dart';
import '../modules/expenses/product_expense/views/product_expense_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/stock/bindings/stock_binding.dart';
import '../modules/stock/views/stock_view.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.EXPENSE,
      page: () => const ExpenseView(),
      binding: ExpenseBinding(),
    ),
    GetPage(
      name: _Paths.STOCK,
      page: () => const StockView(),
      binding: StockBinding(),
    ),
    GetPage(
      name: _Paths.ENTITY,
      page: () => EntityView(),
      binding: EntityBinding(),
    ),
    GetPage(
      name: _Paths.BANK_ACCOUNT,
      page: () => const BankAccountView(),
      binding: BankAccountBinding(),
    ),
    GetPage(
      name: _Paths.DEBITORS_OR_CREDITORS,
      page: () => const DebitorsOrCreditorsView(),
      binding: DebitorsOrCreditorsBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => const UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.ENTITY_DETAILS,
      page: () => const EntityDetailsView(),
      binding: EntityDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_BANK,
      page: () => const AddBankView(),
      binding: AddBankBinding(),
    ),
    GetPage(
      name: _Paths.BANK_DETAILS,
      page: () => const BankDetailsView(),
      binding: BankDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SUB_TRANSACTION,
      page: () => const SubTransactionView(),
      binding: SubTransactionBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_EXPENSE,
      page: () => const ProductExpenseView(),
      binding: ProductExpenseBinding(),
    ),
    GetPage(
      name: _Paths.EXPENSE_TYPE,
      page: () => const ExpenseTypeView(),
      binding: ExpenseTypeBinding(),
    ),
    GetPage(
      name: _Paths.EXPENSE_DETAILS,
      page: () => const ExpenseDetailsView(),
      binding: ExpenseDetailsBinding(),
    ),
    GetPage(
      name: _Paths.BUY,
      page: () => const BuyView(),
      binding: BuyBinding(),
    ),
    GetPage(
      name: _Paths.SALE,
      page: () => const SaleView(),
      binding: SaleBinding(),
    ),
  ];
}
