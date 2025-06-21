// // To parse this JSON data, do
// //
// //     final buyLotModel = buyLotModelFromJson(jsonString);
//
// import 'dart:convert';
//
// import '../../../domain/entities/lot_entity/buy_lot_entity.dart';
//
// BuyLotModel buyLotModelFromJson(String str) => BuyLotModel.fromJson(json.decode(str));
//
// String buyLotModelToJson(BuyLotModel data) => json.encode(data.toJson());
//
// class BuyLotModel {
//   String? message;
//   Lot? lot;
//
//   BuyLotModel({
//     this.message,
//     this.lot,
//   });
//
//   factory BuyLotModel.fromJson(Map<String, dynamic> json) => BuyLotModel(
//     message: json["message"],
//     lot: json["lot"] == null ? null : Lot.fromJson(json["lot"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "message": message,
//     "lot": lot?.toJson(),
//   };
//

// }
//
// class Lot {
//   int? productId;
//   int? vendorId;
//   String? truckNumber;
//   int? totalQuantity;
//   int? remainingQuantity;
//   double? pricePerKg;
//   int? expenses;
//   DateTime? updatedAt;
//   DateTime? createdAt;
//   int? id;
//
//   Lot({
//     this.productId,
//     this.vendorId,
//     this.truckNumber,
//     this.totalQuantity,
//     this.remainingQuantity,
//     this.pricePerKg,
//     this.expenses,
//     this.updatedAt,
//     this.createdAt,
//     this.id,
//   });
//
//   factory Lot.fromJson(Map<String, dynamic> json) => Lot(
//     productId: json["product_id"],
//     vendorId: json["vendor_id"],
//     truckNumber: json["truck_number"],
//     totalQuantity: json["total_quantity"],
//     remainingQuantity: json["remaining_quantity"],
//     pricePerKg: json["price_per_kg"]?.toDouble(),
//     expenses: json["expenses"],
//     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     id: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "product_id": productId,
//     "vendor_id": vendorId,
//     "truck_number": truckNumber,
//     "total_quantity": totalQuantity,
//     "remaining_quantity": remainingQuantity,
//     "price_per_kg": pricePerKg,
//     "expenses": expenses,
//     "updated_at": updatedAt?.toIso8601String(),
//     "created_at": createdAt?.toIso8601String(),
//     "id": id,
//   };
// }


// To parse this JSON data, do
//
//     final buyLotModel = buyLotModelFromJson(jsonString);

import 'dart:convert';

import '../../../domain/entities/lot_entity/buy_lot_entity.dart';

BuyLotModel buyLotModelFromJson(String str) => BuyLotModel.fromJson(json.decode(str));

String buyLotModelToJson(BuyLotModel data) => json.encode(data.toJson());

class BuyLotModel {
  String? message;
  Lot? lot;
  double? vendorBalance;

  BuyLotModel({
    this.message,
    this.lot,
    this.vendorBalance,
  });

  factory BuyLotModel.fromJson(Map<String, dynamic> json) => BuyLotModel(
    message: json["message"],
    lot: json["lot"] == null ? null : Lot.fromJson(json["lot"]),
    vendorBalance: json["vendor_balance"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "lot": lot?.toJson(),
    "vendor_balance": vendorBalance,
  };

  BuyLotEntity toEntity() {
    return BuyLotEntity(
      message: message,
      productId: lot == null ? 0 : lot?.productId ?? 0,
      vendorId: lot == null ? 0 : lot?.vendorId ?? 0,
      truckNumber: lot == null ? '' : lot?.truckNumber ?? '',
      totalQuantity: lot == null ? 0.0 : lot?.totalQuantity ?? 0.0,
      remainingQuantity: lot == null ? 0.0 : lot?.remainingQuantity ?? 0.0,
      pricePerKg: lot == null ? 0.0 : lot?.pricePerKg ?? 0.0,
      expenses: lot == null ? 0 : lot?.expenses ?? 0,
      id: lot == null ? 0 : lot?.id ?? 0,
      paidAmount: lot == null ? 0 : lot?.paidAmount ?? 0,
      dueAmount: lot == null ? 0.0 : lot?.dueAmount ?? 0.0,
      lastBalance: lot == null ? 0.0 : lot?.lastBalance ?? 0.0,
      purchaseDate: lot == null ? DateTime.now() : lot?.purchaseDate ?? DateTime.now(),
      note: lot == null ? '' : lot?.note ?? '',
      vendorBalance: vendorBalance ?? 0.0,
    );
  }
}

class Lot {
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
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Lot({
    this.productId,
    this.vendorId,
    this.truckNumber,
    this.totalQuantity,
    this.remainingQuantity,
    this.pricePerKg,
    this.expenses,
    this.paidAmount,
    this.dueAmount,
    this.lastBalance,
    this.purchaseDate,
    this.note,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Lot.fromJson(Map<String, dynamic> json) => Lot(
    productId: json["product_id"],
    vendorId: json["vendor_id"],
    truckNumber: json["truck_number"],
    totalQuantity: json["total_quantity"]?.toDouble(),
    remainingQuantity: json["remaining_quantity"]?.toDouble(),
    pricePerKg: json["price_per_kg"]?.toDouble(),
    expenses: json["expenses"],
    paidAmount: json["paid_amount"],
    dueAmount: json["due_amount"]?.toDouble(),
    lastBalance: json["last_balance"],
    purchaseDate: json["purchase_date"] == null ? null : DateTime.parse(json["purchase_date"]),
    note: json["note"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "vendor_id": vendorId,
    "truck_number": truckNumber,
    "total_quantity": totalQuantity,
    "remaining_quantity": remainingQuantity,
    "price_per_kg": pricePerKg,
    "expenses": expenses,
    "paid_amount": paidAmount,
    "due_amount": dueAmount,
    "last_balance": lastBalance,
    "purchase_date": purchaseDate?.toIso8601String(),
    "note": note,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
