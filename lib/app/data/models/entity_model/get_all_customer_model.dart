
import 'dart:convert';

import '../../../domain/entities/entity/get_all_customer_entity.dart';

List<GetAllCustomerModel> getAllCustomerModelFromJson(String str) => List<GetAllCustomerModel>.from(json.decode(str).map((x) => GetAllCustomerModel.fromJson(x)));

String getAllCustomerModelToJson(List<GetAllCustomerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllCustomerModel {
  int? id;
  String? name;
  String? phone;
  String? address;
  dynamic note;
  DateTime? createdAt;
  DateTime? updatedAt;

  GetAllCustomerModel({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  factory GetAllCustomerModel.fromJson(Map<String, dynamic> json) => GetAllCustomerModel(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
    note: json["note"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "address": address,
    "note": note,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
  GetAllCustomerEntity toEntity(){
    return GetAllCustomerEntity(
      id: id ?? 0,
      name: name ?? '',
      phone: phone ?? '',
      address: address ?? '',
    );
  }
}
