// To parse this JSON data, do
//
//     final createLotModel = createLotModelFromJson(jsonString);

import 'dart:convert';

import '../../../domain/entities/lot_entity/create_lot_entity.dart';

CreateLotModel createLotModelFromJson(String str) => CreateLotModel.fromJson(json.decode(str));

String createLotModelToJson(CreateLotModel data) => json.encode(data.toJson());

class CreateLotModel {
  String? message;
  Sale? sale;
  double? customerBalance;

  CreateLotModel({this.message, this.sale, this.customerBalance});

  factory CreateLotModel.fromJson(Map<String, dynamic> json) => CreateLotModel(
    message: json["message"],
    sale: json["sale"] == null ? null : Sale.fromJson(json["sale"]),
    customerBalance: json["customer_balance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {"message": message, "sale": sale?.toJson(), "customer_balance": customerBalance};

  CreateLotEntity toEntity() {
    return CreateLotEntity(
      message: message ?? '',
      lotId: sale == null ? 0 : sale?.lotId ?? 0,
      customerId: sale == null ? 0 : sale?.customerId ?? 0,
      totalQuantity: sale == null ? 0.0 : sale?.quantity ?? 0.0,
      pricePerKg: sale == null ? 0.0 : sale?.pricePerKg ?? 0.0,
      totalPrice: sale == null ? 0.0 : sale?.totalPrice ?? 0.0,
      paidAmount: sale == null ? 0.0 : sale?.paidAmount ?? 0.0,
      dueAmount: sale == null ? 0.0 : sale?.dueAmount ?? 0.0,
      lastBalance: sale == null ? 0.0 : sale?.lastBalance ?? 0.0,
      saleDate: sale == null ? DateTime.now() : sale?.saleDate ?? DateTime.now(),
      id: sale == null ? 0 : sale?.id ?? 0,
      customerBalance: customerBalance ?? 0.0,
    );
  }
}

class Sale {
  int? lotId;
  int? customerId;
  double? quantity;
  double? pricePerKg;
  double? totalPrice;
  double? paidAmount;
  double? dueAmount;
  double? lastBalance;
  DateTime? saleDate;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Sale({
    this.lotId,
    this.customerId,
    this.quantity,
    this.pricePerKg,
    this.totalPrice,
    this.paidAmount,
    this.dueAmount,
    this.lastBalance,
    this.saleDate,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Sale.fromJson(Map<String, dynamic> json) => Sale(
    lotId: json["lot_id"],
    customerId: json["customer_id"],
    quantity: json["quantity"]?.toDouble(),
    pricePerKg: json["price_per_kg"]?.toDouble(),
    totalPrice: json["total_price"]?.toDouble(),
    paidAmount: json["paid_amount"],
    dueAmount: json["due_amount"]?.toDouble(),
    lastBalance: json["last_balance"]?.toDouble(),
    saleDate: json["sale_date"] == null ? null : DateTime.parse(json["sale_date"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "lot_id": lotId,
    "customer_id": customerId,
    "quantity": quantity,
    "price_per_kg": pricePerKg,
    "total_price": totalPrice,
    "paid_amount": paidAmount,
    "due_amount": dueAmount,
    "last_balance": lastBalance,
    "sale_date": saleDate?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };
}
