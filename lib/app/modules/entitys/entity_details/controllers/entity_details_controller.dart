import 'package:get/get.dart';

class EntityDetailsController extends GetxController {
  final customersList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCustomers();
  }

  void loadCustomers() {
    customersList.value = [
      {'date': '2024-03-12','sale id' : "432", 'rice name': 'Kobutor(Mojumdar)', 'quantity': '100.00', 'price': '5.800','paid':'4,800',"due":'0',"last_balance" : "2932"},
      {'date': '2024-03-12','sale id' : "432", 'rice name': 'Kobutor(Mojumdar)', 'quantity': '100.00', 'price': '5.800','paid':'4,800',"due":'0',"last_balance" : "13423"},
      {'date': '2024-03-12','sale id' : "432", 'rice name': 'Kobutor(Mojumdar)', 'quantity': '100.00', 'price': '5.800','paid':'4,800',"due":'0',"last_balance" : "1331"},
      {'date': '2024-03-12','sale id' : "432", 'rice name': 'Kobutor(Mojumdar)', 'quantity': '100.00', 'price': '5.800','paid':'4,800',"due":'0',"last_balance" : "432"},
      {'date': '2024-03-12','sale id' : "432", 'rice name': 'Kobutor(Mojumdar)', 'quantity': '100.00', 'price': '5.800','paid':'4,800',"due":'0',"last_balance" : "32"},
      {'date': '2024-03-12','sale id' : "432", 'rice name': 'Kobutor(Mojumdar)', 'quantity': '100.00', 'price': '5.800','paid':'4,800',"due":'674820',"last_balance" : "343"},
    ];
  }
}
