class GetAllProductEntity {
  int? id;
  String? name;
  int? totalQuantity;
  int? remainingQuantity;
  double? latestPricePerKg;
  int? totalPrice;
  int? remainingPrice;
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
