import 'package:get/get.dart';

class DebitorsOrCreditorsController extends GetxController {




  var debitCredit = ''.obs;

  final String subTransaction = 'SubTransaction';



  final customersList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCustomers();
  }

  void loadCustomers() {
    customersList.value = [
      {'id': '24', 'date': '2024-08-23','name': 'MD Yeard','phone': '0190', 'type': 'Credit','balance' : '453662','note': 'Hey Yeard'},
      {'id': '24', 'date': '2024-08-23','name': 'MD Yeard','phone': '0190', 'type': 'Credit','balance' : '453662','note': 'Hey Yeard'},
      {'id': '24', 'date': '2024-08-23','name': 'MD Yeard','phone': '0190', 'type': 'Credit','balance' : '453662','note': 'Hey Yeard'},
    ];
  }
}
