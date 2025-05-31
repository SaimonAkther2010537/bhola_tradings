// To parse this JSON data, do
//
//     final createCustomerDtoModel = createCustomerDtoModelFromJson(jsonString);

import 'dart:convert';

CreateCustomerDtoModel createCustomerDtoModelFromJson(String str) => CreateCustomerDtoModel.fromJson(json.decode(str));

String createCustomerDtoModelToJson(CreateCustomerDtoModel data) => json.encode(data.toJson());

class CreateCustomerDtoModel {
  String? name;
  String? phone;
  String? address;

  CreateCustomerDtoModel({
    this.name,
    this.phone,
    this.address,
  });

  factory CreateCustomerDtoModel.fromJson(Map<String, dynamic> json) => CreateCustomerDtoModel(
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
