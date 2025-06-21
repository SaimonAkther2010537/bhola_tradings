import 'package:get/get.dart';
import '../../core/constant/custom_snackbar.dart';
import '../../data/data_source/local_data_storage/auth_data_storage/local_data_storage_repository.dart';
import '../../data/dto_model/auth/register_dto_model.dart';
import '../../routes/app_pages.dart';
import '../entities/auth_entity/login_response_entity.dart';
import '../entities/auth_entity/register_response_entity.dart';
import '../repositories/auth_repo/auth_repository.dart';

class AuthService extends GetxService {
  final AuthRepository authRepository;
  final LocalDataStorageRepository localDataStorageRepository;

  AuthService({required this.authRepository, required this.localDataStorageRepository});

  ///================================= User Register  ==================================================

  // var registerResponse = RegisterResponseEntity().obs;

  Future<RegisterResponseEntity> userRegister({required RegisterDtoModel registerDtoModel}) async {
    return authRepository.userRegistration(registerDtoModel: registerDtoModel);
  }

  ///================================= User Login ==================================================

  RxString token = "".obs;
  var loginResponse = LoginResponseEntity().obs;

  Future<bool> userLogin({required String email, required String password}) async {
    try {
      LoginResponseEntity loginResponseEntity = await authRepository.userLogin(email: email, password: password).then((value) {
        return loginResponse.value = value;
      });

      token.value = loginResponseEntity.token!;
      localDataStorageRepository.storeAllAuthData(
        accessToken: loginResponseEntity.token!,
        userRole: loginResponseEntity.userType!,
        userName: loginResponseEntity.userName!,
      );

      return true;
    } catch (error) {
      return false;
    }
  }

  /// ************************* User Logout **************************************

  Future<void> userLogout() async {
    authRepository.userLogout(accessToken: localDataStorageRepository.accessToken);
    print(
      '-----------Token----------"${localDataStorageRepository.accessToken} -------${localDataStorageRepository.userRole}-------${localDataStorageRepository.userName}"---------------',
    );
    localDataStorageRepository.clearStoredData();
    print(
      '-----------Token Remove Check----------"${localDataStorageRepository.accessToken} ---------${localDataStorageRepository.userName}---------${localDataStorageRepository.userRole}"---------------',
    );
    CustomSnackBar.showCustomSuccessToast(title: "Success", message: 'User Logout successfully');
    Get.offAllNamed(Routes.LOGIN);
  }
}
