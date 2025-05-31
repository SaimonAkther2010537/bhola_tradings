// To parse this JSON data, do
//
//     final createVendorModel = createVendorModelFromJson(jsonString);

import 'dart:convert';

import '../../../domain/entities/entity/create_vendor_entity.dart';

CreateVendorModel createVendorModelFromJson(String str) => CreateVendorModel.fromJson(json.decode(str));

String createVendorModelToJson(CreateVendorModel data) => json.encode(data.toJson());

class CreateVendorModel {
  String? name;
  String? phone;
  String? address;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  CreateVendorModel({
    this.name,
    this.phone,
    this.address,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory CreateVendorModel.fromJson(Map<String, dynamic> json) => CreateVendorModel(
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

  CreateVendorEntity toEntity() {
    return CreateVendorEntity(
      name: name ?? '',
      phone: phone ?? '',
      address: address ?? '',
    );
  }
}
