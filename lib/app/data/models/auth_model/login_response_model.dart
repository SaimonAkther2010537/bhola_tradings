// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

import '../../../domain/entities/auth_entity/login_response_entity.dart';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  bool? status;
  String? message;
  String? token;
  User? user;

  LoginResponseModel({
    this.status,
    this.message,
    this.token,
    this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    status: json["status"],
    message: json["message"],
    token: json["token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "token": token,
    "user": user?.toJson(),
  };

  LoginResponseEntity toEntity(){
    return LoginResponseEntity(
      message: message ?? '',
      token: token ?? '',
      status: status ?? false,
      userId: user == null ? 0 : user!.id ?? 0,
      userType: user == null ? '' : user!.userType ?? '',
      userName: user == null ? '' : user!.name ?? '',
      email: user == null ? '' : user!.email ?? '',
      phoneNumber: user == null ? '' : user!.phoneNumber ?? '',
    );
  }
}

class User {
  int? id;
  String? name;
  String? phoneNumber;
  String? userType;
  String? email;
  dynamic emailVerifiedAt;
  dynamic comment;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.phoneNumber,
    this.userType,
    this.email,
    this.emailVerifiedAt,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    phoneNumber: json["phone_number"],
    userType: json["user_type"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    comment: json["comment"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone_number": phoneNumber,
    "user_type": userType,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "comment": comment,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
