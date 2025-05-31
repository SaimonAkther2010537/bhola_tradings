
// To parse this JSON data, do
//
//     final createCustomerModel = createCustomerModelFromJson(jsonString);

import 'dart:convert';

import '../../../domain/entities/entity/create_customer_entity.dart';

CreateCustomerModel createCustomerModelFromJson(String str) => CreateCustomerModel.fromJson(json.decode(str));

String createCustomerModelToJson(CreateCustomerModel data) => json.encode(data.toJson());

class CreateCustomerModel {
  String? name;
  String? phone;
  String? address;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  CreateCustomerModel({
    this.name,
    this.phone,
    this.address,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory CreateCustomerModel.fromJson(Map<String, dynamic> json) => CreateCustomerModel(
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "address": address,
    "updated_at": updatedAt?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "id": id,
  };

  CreateCustomerEntity toEntity() {
    return CreateCustomerEntity(
      name: name ?? '',
      phone: phone ?? '',
      address: address ?? '',
    );
  }
}
