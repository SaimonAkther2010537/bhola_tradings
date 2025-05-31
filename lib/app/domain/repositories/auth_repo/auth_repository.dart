
import '../../../data/dto_model/auth/register_dto_model.dart';
import '../../entities/auth_entity/login_response_entity.dart';
import '../../entities/auth_entity/logout_response_entity.dart';
import '../../entities/auth_entity/register_response_entity.dart';

abstract class AuthRepository {

  Future<RegisterResponseEntity> userRegistration({required RegisterDtoModel registerDtoModel});

  Future<LoginResponseEntity> userLogin({required String email,required String password});

  Future<LogoutResponseEntity> userLogout({required String accessToken});




}