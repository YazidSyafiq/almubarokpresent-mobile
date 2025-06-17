import 'package:almubarok_present/controllers/login_controller.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/widgets/button_login_widget.dart';
import 'package:almubarok_present/widgets/loading_overlay.dart';
import 'package:almubarok_present/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorApp.white,
          body: Obx(
            () => controller.isLoading.value
                ? LoadingOverlay()
                : SingleChildScrollView(
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 8,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Image.asset(
                              appImages.imgLogo.path,
                              height: 15.h,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            TextFormFieldWidget(
                              titleForm: 'Email',
                              textEditingController: controller.emailController,
                              isPassword: false,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            TextFormFieldWidget(
                              titleForm: 'Password',
                              textEditingController:
                                  controller.passwordController,
                              isPassword: true,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Obx(
                              () => ButtonLoginWidget(
                                enable: controller.isValidate.value,
                                onTap: () {
                                  controller.login();
                                },
                                titleButton: 'Login',
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
