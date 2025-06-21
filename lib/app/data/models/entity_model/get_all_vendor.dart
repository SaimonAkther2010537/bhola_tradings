// import 'dart:convert';
//
// import '../../../domain/entities/entity/get_all_vendor.dart';
//
// List<GetAllVendorModel> getAllVendorModelFromJson(String str) => List<GetAllVendorModel>.from(json.decode(str).map((x) => GetAllVendorModel.fromJson(x)),);
//
// String getAllVendorModelToJson(List<GetAllVendorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class GetAllVendorModel {
//   int? id;
//   String? name;
//   String? phone;
//   String? address;
//   dynamic note;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   GetAllVendorModel({
//     this.id,
//     this.name,
//     this.phone,
//     this.address,
//     this.note,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory GetAllVendorModel.fromJson(
//     Map<String, dynamic> json,
//   ) => GetAllVendorModel(
//     id: json["id"],
//     name: json["name"],
//     phone: json["phone"],
//     address: json["address"],
//     note: json["note"],
//     createdAt:
//         json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//     updatedAt:
//         json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "phone": phone,
//     "address": address,
//     "note": note,
//     "created_at": createdAt?.toIso8601String(),
//     "updated_at": updatedAt?.toIso8601String(),
//   };
//

// }


// To parse this JSON data, do
//
//     final getAllVendorModel = getAllVendorModelFromJson(jsonString);

import 'dart:convert';

import '../../../domain/entities/entity/get_all_vendor.dart';

GetAllVendorModel getAllVendorModelFromJson(String str) => GetAllVendorModel.fromJson(json.decode(str));

String getAllVendorModelToJson(GetAllVendorModel data) => json.encode(data.toJson());

class GetAllVendorModel {
  List<Vendor>? vendors;
  double? totalBalance;

  GetAllVendorModel({
    this.vendors,
    this.totalBalance,
  });

  factory GetAllVendorModel.fromJson(Map<String, dynamic> json) => GetAllVendorModel(
    vendors: json["vendors"] == null ? [] : List<Vendor>.from(json["vendors"]!.map((x) => Vendor.fromJson(x))),
    totalBalance: json["total_balance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "vendors": vendors == null ? [] : List<dynamic>.from(vendors!.map((x) => x.toJson())),
    "total_balance": totalBalance,
  };
}

class Vendor {
  int? id;
  String? name;
  String? address;
  String? phone;
  double? balance;

  Vendor({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.balance,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    phone: json["phone"],
    balance: json["balance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "phone": phone,
    "balance": balance,
  };

  GetAllVendor toEntity() {
    return GetAllVendor(
      id: id ?? 0,
      name: name ?? '',
      phone: phone ?? '',
      address: address ?? '',
      balance: balance ?? 0.0,
    );
  }
}
