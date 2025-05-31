import 'package:get/get.dart';

class ProductExpenseController extends GetxController {


  final customersList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCustomers();
  }



  void loadCustomers() {
    customersList.value = [
      {'date': '2024-09-18', 'id': '832', 'entryMan': 'Main Operator', 'type': 'Day Labour', 'product' : '-', 'amount': '18393','note': 'Hello Tamim'},
      {'date': '2024-09-18', 'id': '832', 'entryMan': 'Main Operator', 'type': 'Day Labour', 'product' : '-', 'amount': '18393','note': 'Hello Tamim'},
      {'date': '2024-09-18', 'id': '832', 'entryMan': 'Main Operator', 'type': 'Day Labour', 'product' : '-', 'amount': '18393','note': 'Hello Tamim'},
      {'date': '2024-09-18', 'id': '832', 'entryMan': 'Main Operator', 'type': 'Day Labour', 'product' : '-', 'amount': '18393','note': 'Hello Tamim'},
      {'date': '2024-09-18', 'id': '832', 'entryMan': 'Main Operator', 'type': 'Day Labour', 'product' : '-', 'amount': '18393','note': 'Hello Tamim'},
    ];
  }


}
