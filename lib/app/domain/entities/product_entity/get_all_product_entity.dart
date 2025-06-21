class GetAllProductEntity {
  int? id;
  String? name;
  double? totalQuantity;
  double? remainingQuantity;
  double? latestPricePerKg;
  double? totalPrice;
  double? remainingPrice;
  double? averageUnitPrice;

  GetAllProductEntity({
    this.id,
    this.name,
    this.totalQuantity,
    this.remainingQuantity,
    this.latestPricePerKg,
    this.totalPrice,
    this.remainingPrice,
    this.averageUnitPrice,
  });
}
