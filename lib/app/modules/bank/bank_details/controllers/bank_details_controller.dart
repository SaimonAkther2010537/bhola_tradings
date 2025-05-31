import 'package:get/get.dart';

class BankDetailsController extends GetxController {
  final customersList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCustomers();
  }

  void loadCustomers() {
    customersList.value = [
      {'id': '2434', 'date': '2024-08-23', 'type': 'Cash Out', 'transactor': 'Main Operator','amount' : '99322','note': 'Hey Yeard',"last_balance" : "9324"},
      {'id': '2434', 'date': '2024-08-23', 'type': 'Cash Out', 'transactor': 'Main Operator','amount' : '99322','note': 'Hey Yeard',"last_balance" : "2442"},
      {'id': '2434', 'date': '2024-08-23', 'type': 'Cash Out', 'transactor': 'Main Operator','amount' : '99322','note': 'Hey Yeard',"last_balance" : "123"},
      {'id': '2434', 'date': '2024-08-23', 'type': 'Cash Out', 'transactor': 'Main Operator','amount' : '99322','note': 'Hey Yeard',"last_balance" : "2442"},
      {'id': '2434', 'date': '2024-08-23', 'type': 'Cash Out', 'transactor': 'Main Operator','amount' : '99322','note': 'Hey Yeard',"last_balance" : "3433"},
    ];
  }
}
