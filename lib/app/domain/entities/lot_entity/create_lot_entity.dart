class CreateLotEntity {
  String? message;
  int? lotId;
  int? customerId;
  double? totalQuantity;
  double? pricePerKg;
  double? totalPrice;
  double? paidAmount;
  double? dueAmount;
  double? lastBalance;
  DateTime? saleDate;
  int? id;
  double? customerBalance;

  CreateLotEntity({
    this.message,
    this.lotId,
    this.customerId,
    this.totalQuantity,
    this.pricePerKg,
    this.totalPrice,
    this.paidAmount,
    this.dueAmount,
    this.lastBalance,
    this.saleDate,
    this.id,
    this.customerBalance,
  });
}
