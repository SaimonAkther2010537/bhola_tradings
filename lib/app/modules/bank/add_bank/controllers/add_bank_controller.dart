import 'package:get/get.dart';

class AddBankController extends GetxController {
  final customersList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCustomers();
  }

  void loadCustomers() {
    customersList.value = [
      {'date': '2025-02-14', 'name': 'Bhola Trading', 'type': 'Loan(Credited)', 'branch': 'Bhola'},
      {'date': '2025-02-14', 'name': 'Bhola Trading', 'type': 'Loan(Credited)', 'branch': 'Bhola'},
      {'date': '2025-02-14', 'name': 'Bhola Trading', 'type': 'Loan(Credited)', 'branch': 'Bhola'},
      {'date': '2025-02-14', 'name': 'Bhola Trading', 'type': 'Loan(Credited)', 'branch': 'Bhola'},
      {'date': '2025-02-14', 'name': 'Bhola Trading', 'type': 'Loan(Credited)', 'branch': 'Bhola'},
    ];
  }
}
