
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_assets.dart';
import '../../../core/theme/app_color_config.dart';
import '../controllers/login_controller.dart';
import '../widgets/login_form.dart';
import '../widgets/registration_form.dart';
import '../widgets/toggle_button.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.bholaBg),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), // opacity effect
              BlendMode.darken,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Obx(() {
              return Material(
                borderRadius: BorderRadius.circular(16),
                color: AppColor.yellow.withOpacity(0.2),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [


                          /// Toggle Buttons
                          Material(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColor.white,
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ToggleButton(
                                    label: 'Login',
                                    controller: controller,
                                    isLoginButton: true,
                                  ),
                                  const SizedBox(width: 16),
                                  ToggleButton(
                                    label: 'Register',
                                    controller: controller,
                                    isLoginButton: false,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          /// Login or Register Form
                          AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.fastOutSlowIn,
                            child: AnimatedCrossFade(
                              firstChild: LoginForm(controller: controller),
                              secondChild: RegistrationForm(controller: controller),
                              crossFadeState: controller.isLogin.value
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: const Duration(milliseconds: 400),
                              firstCurve: Curves.easeInOut,
                              secondCurve: Curves.easeInOut,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
