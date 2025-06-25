
import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';

import '../../../core/constant/custom_snackbar.dart';
import '../../../core/widgets/custom_loading.dart';
import '../../../data/data_source/local_data_storage/auth_data_storage/local_data_storage_repository.dart';
import '../../../data/dto_model/auth/register_dto_model.dart';
import '../../../domain/entities/auth_entity/register_response_entity.dart';
import '../../../domain/services/auth_service.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final AuthService authService;
  final LocalDataStorageRepository localDataStorageRepository;

  LoginController({
    required this.authService,
    required this.localDataStorageRepository,
  });

  /// Form key for validation
  final loginKey = GlobalKey<FormState>();
  final registrationKey = GlobalKey<FormState>();

  // final fromKey = GlobalKey<FormState>();

  /// Login controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// Register controllers
  final regNameController = TextEditingController();
  final regEmailController = TextEditingController();
  final regPasswordController = TextEditingController();
  final regConfirmPasswordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final userTypeController = TextEditingController();

  /// Toggle between login and register
  final isLogin = true.obs;

  void toggleForm() {
    isLogin.value = !isLogin.value;
  }

  @override
  void dispose() {
    regNameController.dispose();
    regEmailController.dispose();
    regPasswordController.dispose();
    regConfirmPasswordController.dispose();
    phoneNumberController.dispose();
    userTypeController.dispose();
    super.dispose();
  }

  ///******************************** User Login *************************************

  Future<void> userLogin(BuildContext context) async {
    FocusScope.of(context).unfocus();
    Loader.show(context, progressIndicator: Loading());
    try {
      bool loginSuccess = await authService.userLogin(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Loader.hide();

      if (loginSuccess) {
        CustomSnackBar.showCustomSuccessToast(
          title: "Success",
          message: 'User Login Successfully',
        );

        print(
          '-----------Token----------"${localDataStorageRepository.accessToken} -------${localDataStorageRepository.userRole}-------${localDataStorageRepository.userName}"---------------',
        );
        clearLoginFields();


        Get.toNamed(Routes.HOME);
      } else {
        CustomSnackBar.showCustomErrorToast(
          title: "Alert",
          message: 'User not found, Please provide valid email and password',
        );
        clearLoginFields();
      }
    } catch (e) {
      Loader.hide();
      CustomSnackBar.showCustomErrorToast(
        title: "Alert",
        message: 'Please Enter Valid Email & Password',
      );
    }
  }

  /// ****************************** User Register ***************************************

  // late RegisterResponseEntity registerResponse;

  // Rx<RegisterResponseEntity> registerResponse = Rx<RegisterResponseEntity>(RegisterResponseEntity());

  var registerResponse = RegisterResponseEntity().obs;

  Future<void> userRegister({required BuildContext context}) async {
    FocusScope.of(context).unfocus();
    Loader.show(context, progressIndicator: Loading());

    try {
      await authService
          .userRegister(
            registerDtoModel: RegisterDtoModel(
              password: regPasswordController.text.trim(),
              email: regEmailController.text.trim(),
              phoneNumber: phoneNumberController.text.trim(),
              userType: userTypeController.text.trim(),
              name: regNameController.text.trim(),
              passwordConfirmation: regConfirmPasswordController.text.trim(),
            ),
          )
          .then((value) {
            registerResponse.value = value;
            Loader.hide();

            CustomSnackBar.showCustomSuccessToast(
              title: 'Success',
              message: value.message.toString(),
            );
            clearRegistrationFields();
            toggleForm();
            Loader.hide();
          });
    } catch (e) {
      Loader.hide();
      // registerResponse = e as RegisterResponseEntity;
      if (registerResponse.value.message == null) {
        CustomSnackBar.showCustomErrorToast(
          title: "Alert",
          message: 'Email Already Taken',
        );
      } else {
        CustomSnackBar.showCustomErrorToast(
          title: "Alert",
          message: 'Please Try Again',
        );
      }
    }
  }

  void clearRegistrationFields() {
    regNameController.clear();
    regEmailController.clear();
    regPasswordController.clear();
    regConfirmPasswordController.clear();
    phoneNumberController.clear();
    userTypeController.clear();
  }

  void clearLoginFields() {
    emailController.clear();
    passwordController.clear();
    // Get.toNamed(Routes.LOGIN);
  }
}
