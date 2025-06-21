class BuyLotEntity {
  String? message;
  int? productId;
  int? vendorId;
  String? truckNumber;
  double? totalQuantity;
  double? remainingQuantity;
  double? pricePerKg;
  int? expenses;
  int? paidAmount;
  double? dueAmount;
  double? lastBalance;
  DateTime? purchaseDate;
  String? note;
  int? id;
  double? vendorBalance;

  BuyLotEntity({
    this.message,
    this.productId,
    this.vendorId,
    this.truckNumber,
    this.totalQuantity,
    this.remainingQuantity,
    this.pricePerKg,
    this.expenses,
    this.id,
    this.paidAmount,
    this.dueAmount,
    this.lastBalance,
    this.purchaseDate,
    this.note,
    this.vendorBalance,
  });
}
