
import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/constant/custom_snackbar.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../data/dto_model/lot_dto/buy_dto_model.dart';
import '../../../../domain/entities/lot_entity/buy_lot_entity.dart';
import '../../../../domain/services/lot_service.dart';
import '../../../entitys/entity/controllers/entity_controller.dart';
import '../../../stock/controllers/stock_controller.dart';

class BuyController extends GetxController {
  final LotService lotService;
  final EntityController entityController;
  final StockController stockController;
  BuyController( {required this.entityController, required this.stockController, required this.lotService});

  var isSale = false.obs;

  final fromKey = GlobalKey<FormState>();

  final vendorController = TextEditingController();
  final productController = TextEditingController();
  final dateController = TextEditingController();
  final quantityController = TextEditingController();
  final expenseController = TextEditingController();
  final unitPriceController = TextEditingController();
  final totalPriceController = TextEditingController();
  final paidPriceController = TextEditingController();
  final duePriceController = TextEditingController();
  // final buyingStatusController = TextEditingController();
  final truckNumberController = TextEditingController();
  final noteController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _setupCalculationListeners();
  }


  ///******************************* Buy Lot  **********************************

  late BuyLotEntity buyLotEntity;

  Future<void> buyLot({required BuildContext context}) async {
    Loader.show(context, progressIndicator: Loading());



    BuyDtoModel model = BuyDtoModel(
      vendorId: int.parse(entityController.getVendorId(name: vendorController.text.trim())),
      productId: int.parse(stockController.getProductId(name: productController.text.trim())),
      expenses: int.parse(expenseController.text.trim()),
      pricePerKg: double.parse(unitPriceController.text.trim()),
      totalQuantity: double.parse(quantityController.text.trim()),
      truckNumber: truckNumberController.text.trim(),
      paidAmount: int.parse(paidPriceController.text.trim()),
      purchaseDate: parseDateControllerInput(dateController.text.trim()),
      note: noteController.text.trim(),
    );

    try {
      await lotService.buyLot(
        buyDtoModel: model,
      ).then(
            (value) {
          buyLotEntity = value;

          print("============${value.message}");
          Loader.hide();
          clearFields();
          stockController.getAllProduct();
          CustomSnackBar.showCustomSuccessToast(title: "Congratulation", message: "Lot bought successfully");

        },
      );
    } catch (e) {
      Loader.hide();
      var error = e as BuyLotEntity;
      CustomSnackBar.showCustomErrorToast(title: "Alert", message: 'Some error occurred, please try again later');
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

  @override
  void dispose() {
    // Remove listeners before disposing
    quantityController.removeListener(_calculateTotalPrice);
    unitPriceController.removeListener(_calculateTotalPrice);
    totalPriceController.removeListener(_calculateDueAmount);
    paidPriceController.removeListener(_calculateDueAmount);

    // Dispose controllers
    vendorController.dispose();
    productController.dispose();
    dateController.dispose();
    quantityController.dispose();
    expenseController.dispose();
    totalPriceController.dispose();
    paidPriceController.dispose();
    duePriceController.dispose();
    // buyingStatusController.dispose();
    truckNumberController.dispose();
    noteController.dispose();
    unitPriceController.dispose();
    super.dispose();
  }



  void clearFields() {
    vendorController.clear();
    paidPriceController.clear();
    productController.clear();
    truckNumberController.clear();
    dateController.clear();
    quantityController.clear();
    expenseController.clear();
    unitPriceController.clear();
    totalPriceController.clear();
    duePriceController.clear();
    // buyingStatusController.clear();
    noteController.clear();
    // Get.toNamed(Routes.LOGIN);
  }



}