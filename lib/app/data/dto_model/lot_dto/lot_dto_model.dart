// To parse this JSON data, do
//
//     final lotDtoModel = lotDtoModelFromJson(jsonString);

import 'dart:convert';

LotDtoModel lotDtoModelFromJson(String str) => LotDtoModel.fromJson(json.decode(str));

String lotDtoModelToJson(LotDtoModel data) => json.encode(data.toJson());

class LotDtoModel {
  int? lotId;
  int? customerId;
  double? quantity;
  double? pricePerKg;
  double? paidAmount;
  DateTime? saleDate;
  String? note;

  LotDtoModel({
    this.lotId,
    this.customerId,
    this.quantity,
    this.pricePerKg,
    this.paidAmount,
    this.saleDate,
    this.note,
  });

  factory LotDtoModel.fromJson(Map<String, dynamic> json) => LotDtoModel(
    lotId: json["lot_id"],
    customerId: json["customer_id"],
    quantity: json["quantity"]?.toDouble(),
    pricePerKg: json["price_per_kg"]?.toDouble(),
    paidAmount: json["paid_amount"],
    saleDate: json["sale_date"] == null ? null : DateTime.parse(json["sale_date"]),
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "lot_id": lotId,
    "customer_id": customerId,
    "quantity": quantity,
    "price_per_kg": pricePerKg,
    "paid_amount": paidAmount,
    "sale_date": "${saleDate!.year.toString().padLeft(4, '0')}-${saleDate!.month.toString().padLeft(2, '0')}-${saleDate!.day.toString().padLeft(2, '0')}",
    "note": note,
  };
}
