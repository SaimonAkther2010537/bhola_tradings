class LoginResponseEntity {
  String? message;
  String? token;
  bool? status;
  int? userId;
  String? userName;
  String? phoneNumber;
  String? userType;
  String? email;

  LoginResponseEntity({
    this.message,
    this.email,
    this.userId,
    this.token,
    this.userType,
    this.userName,
    this.phoneNumber,
    this.status,
  });
}
