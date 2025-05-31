// To parse this JSON data, do
//
//     final logoutResponseModel = logoutResponseModelFromJson(jsonString);

import 'dart:convert';

import '../../../domain/entities/auth_entity/logout_response_entity.dart';

LogoutResponseModel logoutResponseModelFromJson(String str) => LogoutResponseModel.fromJson(json.decode(str));

String logoutResponseModelToJson(LogoutResponseModel data) => json.encode(data.toJson());

class LogoutResponseModel {
  bool? status;
  String? message;
  List<dynamic>? data;

  LogoutResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) => LogoutResponseModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
  };

  LogoutResponseEntity toEntity(){
    return LogoutResponseEntity(
      message: message ?? '',
      status: status ?? true,
    );
  }
}
