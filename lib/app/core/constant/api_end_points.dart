import 'api_config_dart.dart';

class ApiEndPoints {

  /// Auth Module APIS
  String register = "${ApiConfig().baseUrl}/api/register";
  String login = "${ApiConfig().baseUrl}/api/login";
  String logout = "${ApiConfig().baseUrl}/api/logout";


  ///------------------ Entity --------------------
  String getCustomerUrl = "${ApiConfig().baseUrl}/api/summary/customers";
  String getVendorUrl = "${ApiConfig().baseUrl}/api/summary/vendors";

  String createCustomerUrl = "${ApiConfig().baseUrl}/api/customers";
  String createVendorUrl = "${ApiConfig().baseUrl}/api/vendors";

  ///------------------ Product --------------------
  String getProductUrl = "${ApiConfig().baseUrl}/api/products";
  String createProductUrl = "${ApiConfig().baseUrl}/api/products";

  ///------------------ Lot buy & Sale --------------------
  String createLotUrl = "${ApiConfig().baseUrl}/api/lot/buy";
  String sellLotUrl = "${ApiConfig().baseUrl}/api/lot/sell";
  String getAllLotUrl = "${ApiConfig().baseUrl}/api/lots/available/all";


}
