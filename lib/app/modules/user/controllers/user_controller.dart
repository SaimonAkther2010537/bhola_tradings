import 'package:get/get.dart';

class UserController extends GetxController {
  final customersList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCustomers();
  }

  void loadCustomers() {
    customersList.value = [
      {'name': 'Admin','role' : 'Super Admin', 'phone': '01711', 'email': 'yeard@gmail.com', 'total': '45'},
      {'name': 'Main Admin','role' : 'Operator Admin', 'phone': '01711', 'email': 'tanbir@gmail.com', 'total': '45'},
      {'name': 'Admin','role' : 'Super Admin', 'phone': '01711', 'email': 'yeard@gmail.com', 'total': '45'},

    ];
  }
}
