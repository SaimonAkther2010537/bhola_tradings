
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

import '../../../../core/constant/custom_snackbar.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../data/dto_model/entity_dto/create_customer_dto_model.dart';
import '../../../../data/dto_model/entity_dto/create_vendor_dto_model.dart';
import '../../../../domain/entities/entity/create_customer_entity.dart';
import '../../../../domain/entities/entity/create_vendor_entity.dart';
import '../../../../domain/entities/entity/get_all_customer_entity.dart';
import '../../../../domain/entities/entity/get_all_vendor.dart';
import '../../../../domain/services/entity_service.dart';

class EntityController extends GetxController {

  final EntityService entityService;

  EntityController({required this.entityService});



  ///================================= Important For Page Switch  ==================================================
  var entity = ''.obs;
  final String entityDetails = 'entityDetails';


  ///================================= Text Controller  ==================================================

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final userTypeController = TextEditingController();

  ///================================= Text Controller Dispose  ==================================================
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    userTypeController.dispose();
    super.dispose();
  }



  @override
  void onInit() {
    getAllCustomer();
    getAllVendor();
    super.onInit();
  }


  /// ----------------------------- Get All Customer ------------------------------

  var getAllCustomerList = <GetAllCustomerEntity>[].obs;
  var isLoading = false.obs;


  Future<void> getAllCustomer() async {
    getAllCustomerList.clear();
    isLoading.value = true;

    try {
      await entityService.getAllCustomer().then((value) {
        getAllCustomerList.addAll(value);
        isLoading.value = false;
      },);
    } catch (e) {
      print("screen error : $e");
      isLoading.value = false;
    }
  }


  /// ----------------------------- Get All Vendor ------------------------------

  var allVendorList = <GetAllVendor>[].obs;
  var isLoading2 = false.obs;


  Future<void> getAllVendor() async {
    allVendorList.clear();
    isLoading2.value = true;

    try {
      await entityService.getAllVendor().then((value) {
        allVendorList.addAll(value);
        isLoading2.value = false;
      },);
    } catch (e) {
      print("screen error : $e");
      isLoading2.value = false;
    }
  }



  ///******************************* Create Customer  **********************************

  late CreateCustomerEntity createCustomerEntity;

  Future<void> createCustomer({required BuildContext context}) async {
    Loader.show(context, progressIndicator: Loading());


    CreateCustomerDtoModel model = CreateCustomerDtoModel(
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      address: addressController.text.trim(),
    );

    try {
      await entityService.createCustomer(
        createCustomerDtoModel: model,
      ).then(
            (value) {
          createCustomerEntity = value;
          Loader.hide();
          Get.back();
          clearFields();
          getAllCustomer();
          CustomSnackBar.showCustomSuccessToast(title: "Congratulation", message: "Customer created Successfully");
        },
      );
    } catch (e) {
      Loader.hide();
      var error = e as CreateCustomerEntity;
      Get.back();
      CustomSnackBar.showCustomErrorToast(title: "Alert", message: 'Some error occurred, please try again later');
    }
  }


  ///******************************* Create Vendor  **********************************
  late CreateVendorEntity createVendorEntity;

  Future<void> createVendor({required BuildContext context}) async {
    Loader.show(context, progressIndicator: Loading());

    CreateVendorDtoModel model = CreateVendorDtoModel(
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      address: addressController.text.trim(),
    );

    try {
      await entityService.createVendor(
        createVendorDtoModel: model,
      ).then(
            (value) {
          createVendorEntity = value;
          Loader.hide();
          Get.back();
          clearFields();
          getAllVendor();
          CustomSnackBar.showCustomSuccessToast(title: "Congratulation", message: "Vendor created Successfully");
        },
      );
    } catch (e) {
      Loader.hide();
      var error = e as CreateCustomerEntity;
      Get.back();
      CustomSnackBar.showCustomErrorToast(title: "Alert", message: 'Some error occurred, please try again later');
    }
  }


  void clearFields() {
    nameController.clear();
    phoneController.clear();
    addressController.clear();
    userTypeController.clear();
    // Get.toNamed(Routes.LOGIN);
  }
}