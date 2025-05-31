import 'api_config_dart.dart';

class ApiEndPoints {

  /// Auth Module APIS
  String register = "${ApiConfig().baseUrl}/api/register";
  String login = "${ApiConfig().baseUrl}/api/login";
  String logout = "${ApiConfig().baseUrl}/api/logout";


  ///------------------ Entity --------------------
  String getCustomerUrl = "${ApiConfig().baseUrl}/api/customers";
  String getVendorUrl = "${ApiConfig().baseUrl}/api/vendors";

  ///------------------ Product --------------------
  String getProductUrl = "${ApiConfig().baseUrl}/api/products";

}
