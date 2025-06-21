// To parse this JSON data, do
//
//     final getAllLotModel = getAllLotModelFromJson(jsonString);

import 'dart:convert';

import '../../../domain/entities/lot_entity/get_all_lot_entity.dart';

GetAllLotModel getAllLotModelFromJson(String str) => GetAllLotModel.fromJson(json.decode(str));

String getAllLotModelToJson(GetAllLotModel data) => json.encode(data.toJson());

class GetAllLotModel {
  bool? status;
  String? message;
  Map<String, List<Lot>>? lots;

  GetAllLotModel({this.status, this.message, this.lots});

  factory GetAllLotModel.fromJson(Map<String, dynamic> json) {
    final lotsRaw = json["lots"];
    Map<String, List<Lot>> lotsParsed = {};

    if (lotsRaw is Map) {
      lotsRaw.forEach((k, v) {
        lotsParsed[k] = List<Lot>.from((v as List).map((x) => Lot.fromJson(x)));
      });
    }
    // If lotsRaw is not a Map, lotsParsed stays empty

    return GetAllLotModel(status: json["status"], message: json["message"], lots: lotsParsed.isEmpty ? null : lotsParsed);
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "lots": Map.from(lots!).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
  };

  List<GetAllLotEntity> toEntityList() {
    final List<GetAllLotEntity> entities = [];
    if (lots != null) {
      lots!.forEach((key, value) {
        for (var lot in value) {
          entities.add(lot.toEntity());
        }
      });
    }
    return entities;
  }
}

class Lot {
  int? id;
  int? productId;
  String? productName;
  DateTime? purchaseDate;
  double? remainingQuantity;
  double? pricePerKg;
  String? truckNumber;

  Lot({this.id, this.productId, this.productName, this.purchaseDate, this.remainingQuantity, this.pricePerKg, this.truckNumber});

  factory Lot.fromJson(Map<String, dynamic> json) => Lot(
    id: json["id"],
    productId: json["product_id"],
    productName: json["product_name"]!,
    purchaseDate: json["purchase_date"] == null ? null : DateTime.parse(json["purchase_date"]),
    remainingQuantity: json["remaining_quantity"]?.toDouble(),
    pricePerKg: json["price_per_kg"]?.toDouble(),
    truckNumber: json["truck_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "product_name": productName,
    "purchase_date": purchaseDate?.toIso8601String(),
    "remaining_quantity": remainingQuantity,
    "price_per_kg": pricePerKg,
    "truck_number": truckNumber,
  };

  GetAllLotEntity toEntity() {
    return GetAllLotEntity(
      id: id,
      productId: productId ?? 0,
      productName: productName ?? '',
      purchaseDate: purchaseDate ?? DateTime.now(),
      remainingQuantity: remainingQuantity ?? 0.0,
      pricePerKg: pricePerKg ?? 0.0,
      truckNumber: truckNumber ?? '',
    );
  }
}
