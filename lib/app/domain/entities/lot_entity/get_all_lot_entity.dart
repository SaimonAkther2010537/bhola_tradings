class GetAllLotEntity {
  int? id;
  int? productId;
  String? productName;
  DateTime? purchaseDate;
  double? remainingQuantity;
  double? pricePerKg;
  String? truckNumber;

  GetAllLotEntity({
    this.id,
    this.productId,
    this.productName,
    this.purchaseDate,
    this.pricePerKg,
    this.remainingQuantity,
    this.truckNumber,
  });
}
