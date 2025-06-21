import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

import '../../../core/constant/custom_snackbar.dart';
import '../../../core/widgets/custom_loading.dart';
import '../../../domain/entities/product_entity/create_product_entity.dart';
import '../../../domain/entities/product_entity/get_all_product_entity.dart';
import '../../../domain/services/product_service.dart';

class StockController extends GetxController {
  final ProductService productService;

  StockController({required this.productService});


  ///==================== Controller ===================

  final formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();
  final productNameController = TextEditingController();



  @override
  void onInit() {
    getAllProduct();
    super.onInit();
  }


  /// ----------------------------- Get All Product ------------------------------

  var allProductList = <GetAllProductEntity>[].obs;
  var isLoading = false.obs;


  String getProductId({required String name}) {
    return allProductList.firstWhere((element) => element.name.toString().compareTo(name) == 0).id.toString();
  }

  Future<void> getAllProduct() async {
    allProductList.clear();
    isLoading.value = true;

    try {
      await productService.getAllProduct().then((value) {
        allProductList.addAll(value);
        isLoading.value = false;
      },);
    } catch (e) {
      print("screen error : $e");
      isLoading.value = false;
    }
  }


  ///================================= Create Product ================================

  late CreateProductEntity createProductEntity;

  Future<void> createProduct({required BuildContext context}) async {
    Loader.show(context, progressIndicator: Loading());

    try {
      await productService.createProduct(
        productName: productNameController.text.trim(),
      ).then(
            (value) {
              createProductEntity = value;
          Loader.hide();
          Get.back();
          clearFields();
          getAllProduct();
          CustomSnackBar.showCustomSuccessToast(title: "Success", message: "Product created Successfully");
        },
      );
    } catch (e) {
      Loader.hide();
      var error = e as CreateProductEntity;
      Get.back();
      CustomSnackBar.showCustomErrorToast(title: "Alert", message: 'Some error occurred, please try again later');
    }
  }



  void clearFields() {
    productNameController.clear();
    // Get.toNamed(Routes.LOGIN);
  }

  ///==================== Demo Product Card Data ===================

  final List<Map<String, String>> stockItems = [
    {"name": "Demo Product 1", "value": "10"},
    {"name": "Demo Product 2", "value": "5"},
    {"name": "Demo Product 3", "value": "20"},
    {"name": "Demo Product 4", "value": "8"},
    {"name": "Demo Product 5", "value": "12"},
  ];


}
