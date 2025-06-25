import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/constant/custom_snackbar.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../data/dto_model/lot_dto/lot_dto_model.dart';
import '../../../../domain/entities/lot_entity/create_lot_entity.dart';
import '../../../../domain/entities/lot_entity/get_all_lot_entity.dart';
import '../../../../domain/services/lot_service.dart';
import '../../../entitys/entity/controllers/entity_controller.dart';

class SaleController extends GetxController {
  final LotService lotService;
  final EntityController entityController;

  SaleController({required this.lotService, required this.entityController});

  @override
  void onInit() {
    _setupCalculationListeners();
    super.onInit();
  }

  final count = 0.obs;

  void increment() => count.value++;

  final fromKey = GlobalKey<FormState>();

  final customerController = TextEditingController();
  final lotController = TextEditingController();
  final dateController = TextEditingController();
  final quantityController = TextEditingController();
  final unitPriceController = TextEditingController();
  final totalPriceController = TextEditingController();
  final paidPriceController = TextEditingController();
  final duePriceController = TextEditingController();

  // final buyingStatusController = TextEditingController();
  final noteController = TextEditingController();

  /// ----------------------------- Get All Customer ------------------------------

  var getAllLotList = <GetAllLotEntity>[].obs;
  var isLoading = false.obs;

  Future<void> getAllLot() async {
    getAllLotList.clear();
    isLoading.value = true;
    try {
      await lotService.getAllLot().then((value) {
        getAllLotList.addAll(value);
        isLoading.value = false;
      });
    } catch (e) {
      print("screen error : $e");
      isLoading.value = false;
    }
  }

  ///******************************* Sell Lot Customer  **********************************

  late CreateLotEntity createLotEntity;

  Future<void> saleLot({required BuildContext context}) async {
    Loader.show(context, progressIndicator: Loading());

    LotDtoModel model = LotDtoModel(
      lotId: int.parse(lotController.text.split(' ').first),
      customerId: int.parse(
        entityController.getCustomerId(name: customerController.text.trim()),
      ),
      pricePerKg: double.parse(unitPriceController.text.trim()),
      quantity: double.parse(quantityController.text.trim()),
      paidAmount: double.parse(paidPriceController.text.trim()),
      saleDate: parseDateControllerInput(dateController.text.trim()),
      note: noteController.text.trim(),
    );

    try {
      await lotService.saleLot(lotDtoModel: model).then((value) async {
        createLotEntity = value;
        await getAllLot();
        Loader.hide();
        clearFields();
        update(); // Force UI update for dropdowns
        CustomSnackBar.showCustomSuccessToast(
          title: "Congratulation",
          message: "Lot sold successfully",
        );
      });
    } catch (e) {
      Loader.hide();
      clearFields();
      update(); // Force UI update for dropdowns
      var error = e as CreateLotEntity;
      try {
        if (error != "") {
          CustomSnackBar.showCustomErrorToast(
            title: "Alert",
            message: error.error.toString(),
          );
        }
      } catch (e) {
        CustomSnackBar.showCustomErrorToast(
          title: "Alert",
          message: 'Some error occurred, please try again later',
        );
      }
    }
  }

  void _setupCalculationListeners() {
    quantityController.addListener(_calculateTotalPrice);
    unitPriceController.addListener(_calculateTotalPrice);

    totalPriceController.addListener(_calculateDueAmount);
    paidPriceController.addListener(_calculateDueAmount);
  }

  void _calculateTotalPrice() {
    final quantity = double.tryParse(quantityController.text) ?? 0.0;
    final unitPrice = double.tryParse(unitPriceController.text) ?? 0.0;

    final totalPrice = quantity * unitPrice;
    totalPriceController.text = totalPrice.toStringAsFixed(2);
  }

  void _calculateDueAmount() {
    final totalPrice = double.tryParse(totalPriceController.text) ?? 0.0;
    final paidPrice = double.tryParse(paidPriceController.text) ?? 0.0;

    final dueAmount = totalPrice - paidPrice;
    duePriceController.text = dueAmount.toStringAsFixed(2);
  }

  void clearFields() {
    lotController.clear();
    customerController.clear();
    dateController.clear();
    quantityController.clear();
    unitPriceController.clear();
    totalPriceController.clear();
    duePriceController.clear();
    paidPriceController.clear();
    noteController.clear();
  }
}
