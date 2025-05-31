// To parse this JSON data, do
//
//     final getAllProductModel = getAllProductModelFromJson(jsonString);

import 'dart:convert';

import '../../../domain/entities/product_entity/get_all_product_entity.dart';

List<GetAllProductModel> getAllProductModelFromJson(String str) => List<GetAllProductModel>.from(json.decode(str).map((x) => GetAllProductModel.fromJson(x)));

String getAllProductModelToJson(List<GetAllProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllProductModel {
  int? id;
  String? name;
  int? totalQuantity;
  int? remainingQuantity;
  double? latestPricePerKg;
  int? totalPrice;
  int? remainingPrice;
  double? averageUnitPrice;

  GetAllProductModel({
    this.id,
    this.name,
    this.totalQuantity,
    this.remainingQuantity,
    this.latestPricePerKg,
    this.totalPrice,
    this.remainingPrice,
    this.averageUnitPrice,
  });

  factory GetAllProductModel.fromJson(Map<String, dynamic> json) => GetAllProductModel(
    id: json["id"],
    name: json["name"],
    totalQuantity: json["total_quantity"],
    remainingQuantity: json["remaining_quantity"],
    latestPricePerKg: json["latest_price_per_kg"]?.toDouble(),
    totalPrice: json["total_price"],
    remainingPrice: json["remaining_price"],
    averageUnitPrice: json["average_unit_price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "total_quantity": totalQuantity,
    "remaining_quantity": remainingQuantity,
    "latest_price_per_kg": latestPricePerKg,
    "total_price": totalPrice,
    "remaining_price": remainingPrice,
    "average_unit_price": averageUnitPrice,
  };

  GetAllProductEntity toEntity(){
    return GetAllProductEntity(
      id: id ?? 0,
      name: name ?? '',
      totalQuantity: totalQuantity ?? 0,
      remainingQuantity: remainingQuantity ?? 0,
      latestPricePerKg: latestPricePerKg ?? 0,
      totalPrice: totalPrice ?? 0,
      remainingPrice: remainingPrice ?? 0,
      averageUnitPrice: averageUnitPrice ?? 0.0,
    );
  }
}
