// To parse this JSON data, do
//
//     final createVendorDtoModel = createVendorDtoModelFromJson(jsonString);

import 'dart:convert';

CreateVendorDtoModel createVendorDtoModelFromJson(String str) => CreateVendorDtoModel.fromJson(json.decode(str));

String createVendorDtoModelToJson(CreateVendorDtoModel data) => json.encode(data.toJson());

class CreateVendorDtoModel {
  String? name;
  String? phone;
  String? address;

  CreateVendorDtoModel({
    this.name,
    this.phone,
    this.address,
  });

  factory CreateVendorDtoModel.fromJson(Map<String, dynamic> json) => CreateVendorDtoModel(
    name: json["name"],
    phone: json["phone"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
    "address": address,
  };
}
