// To parse this JSON data, do
//
//     final registerDtoModel = registerDtoModelFromJson(jsonString);

import 'dart:convert';

RegisterDtoModel registerDtoModelFromJson(String str) => RegisterDtoModel.fromJson(json.decode(str));

String registerDtoModelToJson(RegisterDtoModel data) => json.encode(data.toJson());

class RegisterDtoModel {
  String? name;
  String? phoneNumber;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? userType;

  RegisterDtoModel({
    this.name,
    this.phoneNumber,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.userType,
  });

  factory RegisterDtoModel.fromJson(Map<String, dynamic> json) => RegisterDtoModel(
    name: json["name"],
    phoneNumber: json["phone_number"],
    email: json["email"],
    password: json["password"],
    passwordConfirmation: json["password_confirmation"],
    userType: json["user_type"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone_number": phoneNumber,
    "email": email,
    "password": password,
    "password_confirmation": passwordConfirmation,
    "user_type": userType,
  };
}
