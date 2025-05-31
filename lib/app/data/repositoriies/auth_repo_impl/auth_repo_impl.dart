import 'dart:async';

import '../../../core/constant/api_end_points.dart';
import '../../../core/networking/base_client.dart';
import '../../../domain/entities/auth_entity/login_response_entity.dart';
import '../../../domain/entities/auth_entity/logout_response_entity.dart';
import '../../../domain/entities/auth_entity/register_response_entity.dart';
import '../../../domain/repositories/auth_repo/auth_repository.dart';
import '../../dto_model/auth/register_dto_model.dart';
import '../../models/auth_model/login_response_model.dart';
import '../../models/auth_model/logout_response_model.dart';
import '../../models/auth_model/registration_response_model.dart';

class AuthRepositoryImpl implements AuthRepository {

  ///======================================= User Register ==========================================

  @override
  Future<RegisterResponseEntity> userRegistration(
      {required RegisterDtoModel registerDtoModel}) async {
    final completer = Completer<RegisterResponseEntity>();

    try {
      await BaseClient().safeApiCall(
        ApiEndPoints().register,
        RequestType.post,
        data: registerDtoModel.toJson(),
        onSuccess: (response) {
          if (response.statusCode == 200) {
            completer.complete(
                RegisterResponseModel.fromJson(response.data).toEntity());
          } else {
            completer.completeError(response.data['error']['detail']);
          }
        },
        onError: (e) {
          // print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" + e.response!.data['message'].toString());

          completer.completeError(e);
        },
      );
    } catch (error) {
      completer.completeError(error);
    }

    return completer.future;
  }


  ///======================================= User Register ==========================================

  @override
  Future<LoginResponseEntity> userLogin(
      {required String email, required String password}) async {
    final completer = Completer<LoginResponseEntity>();

    try {
      await BaseClient().safeApiCall(
        ApiEndPoints().login,
        RequestType.post,
        data: {
          "email": email,
          "password": password
        },
        onSuccess: (response) {
          if (response.statusCode == 200) {
            completer.complete(
                LoginResponseModel.fromJson(response.data).toEntity());
          } else {
            completer.completeError(response.data['error']['detail']);
          }
        },
        onError: (e) {
          // print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" + e.response!.data['message'].toString());

          completer.completeError(e);
        },
      );
    } catch (error) {
      completer.completeError(error);
    }

    return completer.future;
  }


  ///======================================= User Logout ==========================================

  @override
  Future<LogoutResponseEntity> userLogout({required String accessToken}) async {
    final completer = Completer<LogoutResponseEntity>();


    // Map<String, dynamic> data = {};

    try {
      await BaseClient().safeApiCall(
        ApiEndPoints().logout,
        RequestType.get,
        headers: {"Authorization": "Bearer $accessToken"},
        onSuccess: (response) {
          if (response.statusCode == 200) {
            completer.complete(LogoutResponseModel.fromJson(response.data).toEntity());
          } else {
            // completer.completeError(response.data['message']);
            completer.complete(LogoutResponseModel.fromJson(response.data).toEntity());
          }
        },
        onError: (error) {
          // print(error.response);
          // completer.completeError(error.message);
          completer.complete(LogoutResponseModel.fromJson(error.response!.data).toEntity());
        },
      );
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

}
