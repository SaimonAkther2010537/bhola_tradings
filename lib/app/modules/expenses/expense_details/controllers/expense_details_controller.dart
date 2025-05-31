import 'package:get/get.dart';

class ExpenseDetailsController extends GetxController {
  final customersList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCustomers();
  }



  void loadCustomers() {
    customersList.value = [
      {'date': '2024-09-18', 'id': '832', 'entryMan': 'Main Operator', 'product': '-', 'amount': '18393','note': 'Hello Tamim'},
      {'date': '2024-09-18', 'id': '832', 'entryMan': 'Main Operator', 'product': '-', 'amount': '18393','note': 'Hello Tamim'},
      {'date': '2024-09-18', 'id': '832', 'entryMan': 'Main Operator', 'product': '-', 'amount': '18393','note': 'Hello Tamim'},
      {'date': '2024-09-18', 'id': '832', 'entryMan': 'Main Operator', 'product': '-', 'amount': '18393','note': 'Hello Tamim'},
      {'date': '2024-09-18', 'id': '832', 'entryMan': 'Main Operator', 'product': '-', 'amount': '18393','note': 'Hello Tamim'},
    ];
  }
}
