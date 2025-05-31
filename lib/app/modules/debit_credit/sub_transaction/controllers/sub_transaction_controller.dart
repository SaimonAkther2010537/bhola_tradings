import 'package:get/get.dart';

class SubTransactionController extends GetxController {

  final customersList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCustomers();
  }

  void loadCustomers() {
    customersList.value = [
      {'id': '1624', 'type': 'Cash Out', 'amount' : '453662','date': '2024-08-23','transactor': 'Main Operator','note': 'Hey Yeard'},
      {'id': '1624', 'type': 'Cash Out', 'amount' : '453662','date': '2024-08-23','transactor': 'Main Operator','note': 'Hey Yeard'},
      {'id': '1624', 'type': 'Cash Out', 'amount' : '453662','date': '2024-08-23','transactor': 'Main Operator','note': 'Hey Yeard'},
    ];
  }
}
