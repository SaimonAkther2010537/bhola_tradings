import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StockController extends GetxController {


  ///==================== Controller ===================

  var searchController = TextEditingController();
  final productNameController = TextEditingController();



  ///==================== Demo Product Card Data ===================

  final List<Map<String, String>> stockItems = [
    {"name": "Demo Product 1", "value": "10"},
    {"name": "Demo Product 2", "value": "5"},
    {"name": "Demo Product 3", "value": "20"},
    {"name": "Demo Product 4", "value": "8"},
    {"name": "Demo Product 5", "value": "12"},
  ];


}
