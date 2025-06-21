// To parse this JSON data, do
//
//     final buyDtoModel = buyDtoModelFromJson(jsonString);

import 'dart:convert';

BuyDtoModel buyDtoModelFromJson(String str) => BuyDtoModel.fromJson(json.decode(str));

String buyDtoModelToJson(BuyDtoModel data) => json.encode(data.toJson());

class BuyDtoModel {
  int? productId;
  int? vendorId;
  String? truckNumber;
  double? totalQuantity;
  double? pricePerKg;
  int? expenses;
  int? paidAmount;
  DateTime? purchaseDate;
  String? note;

  BuyDtoModel({
    this.productId,
    this.vendorId,
    this.truckNumber,
    this.totalQuantity,
    this.pricePerKg,
    this.expenses,
    this.paidAmount,
    this.purchaseDate,
    this.note,
  });

  factory BuyDtoModel.fromJson(Map<String, dynamic> json) => BuyDtoModel(
    productId: json["product_id"],
    vendorId: json["vendor_id"],
    truckNumber: json["truck_number"],
    totalQuantity: json["total_quantity"]?.toDouble(),
    pricePerKg: json["price_per_kg"]?.toDouble(),
    expenses: json["expenses"],
    paidAmount: json["paid_amount"],
    purchaseDate: json["purchase_date"] == null ? null : DateTime.parse(json["purchase_date"]),
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "vendor_id": vendorId,
    "truck_number": truckNumber,
    "total_quantity": totalQuantity,
    "price_per_kg": pricePerKg,
    "expenses": expenses,
    "paid_amount": paidAmount,
    "purchase_date": "${purchaseDate!.year.toString().padLeft(4, '0')}-${purchaseDate!.month.toString().padLeft(2, '0')}-${purchaseDate!.day.toString().padLeft(2, '0')}",
    "note": note,
  };
}
