import 'package:almubarok_present/controllers/initial_controller.dart';
import 'package:almubarok_present/models/login_response_model.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/services/api/auth_service.dart';
import 'package:almubarok_present/widgets/snackbar_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  InitialController initialController = Get.find();

  Rx<LoginResponseModel> loginResponse = LoginResponseModel().obs;

  RxBool isValidate = false.obs;
  RxBool isLoading = false.obs;
  RxString token = ''.obs;

  @override
  void onInit() {
    emailController.addListener(validate);
    passwordController.addListener(validate);
    super.onInit();
  }

  void validate() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isValidate.value = true;
    } else {
      isValidate.value = false;
    }
  }

  Future<void> login() async {
    isLoading.value = true;
    try {
      FormData formData = FormData.fromMap(
        {
          'email': emailController.text,
          'password': passwordController.text,
        },
      );

      final response = await AuthService.login(
        formData: formData,
      );

      if (response.data != null) {
        loginResponse.value = LoginResponseModel.fromJson(
          response.data,
        );
        token.value = loginResponse.value.data!.token!;
        initialController.saveAuth(token.value);
      }
    } catch (e) {
      SnackbarWidget.defaultSnackbar(
        icon: Icon(
          Icons.cancel,
          color: ColorApp.red,
        ),
        title: 'Gagal!',
        subtitle: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
