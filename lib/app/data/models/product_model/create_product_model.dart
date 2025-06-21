// To parse this JSON data, do
//
//     final createProductModel = createProductModelFromJson(jsonString);

import 'dart:convert';

import '../../../domain/entities/product_entity/create_product_entity.dart';

CreateProductModel createProductModelFromJson(String str) => CreateProductModel.fromJson(json.decode(str));

String createProductModelToJson(CreateProductModel data) => json.encode(data.toJson());

class CreateProductModel {
  String? message;
  Product? product;

  CreateProductModel({
    this.message,
    this.product,
  });

  factory CreateProductModel.fromJson(Map<String, dynamic> json) => CreateProductModel(
    message: json["message"],
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "product": product?.toJson(),
  };

  CreateProductEntity toEntity() {
    return CreateProductEntity(
      message: message,
      productName: product == null ? '' : product!.name ?? '',
    );
  }
}

class Product {
  String? name;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Product({
    this.name,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };


}
