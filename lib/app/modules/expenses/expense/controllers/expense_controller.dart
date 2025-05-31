import 'package:get/get.dart';

class ExpenseController extends GetxController {




  var expenseType = ''.obs;

  final String productExpense = 'ProductExpense';
  final String expenseTypes = 'ExpenseTypes';
  final String expenseDetails = 'ExpenseDetails';



  final customersList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCustomers();
  }



  void loadCustomers() {
    customersList.value = [
      {'date': '2024-09-18', 'id': '832', 'entryMan': 'Main Operator', 'type': 'Day Labour', 'amount': '18393','note': 'Hello Tamim'},
      {'date': '2024-09-18', 'id': '832', 'entryMan': 'Main Operator', 'type': 'Day Labour', 'amount': '18393','note': 'Hello Tamim'},
      {'date': '2024-09-18', 'id': '832', 'entryMan': 'Main Operator', 'type': 'Day Labour', 'amount': '18393','note': 'Hello Tamim'},
      {'date': '2024-09-18', 'id': '832', 'entryMan': 'Main Operator', 'type': 'Day Labour', 'amount': '18393','note': 'Hello Tamim'},
      {'date': '2024-09-18', 'id': '832', 'entryMan': 'Main Operator', 'type': 'Day Labour', 'amount': '18393','note': 'Hello Tamim'},
    ];
  }



}
