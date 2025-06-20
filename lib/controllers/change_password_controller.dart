import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/services/api/auth_service.dart';
import 'package:almubarok_present/widgets/snackbar_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;

class ChangePasswordController extends GetxController {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> changePassword() async {
    isLoading.value = true;
    try {
      if (currentPasswordController.text == newPasswordController.text) {
        SnackbarWidget.defaultSnackbar(
          icon: Icon(
            Icons.cancel,
            color: ColorApp.red,
          ),
          title: 'Gagal!',
          subtitle: 'Password Baru Tidak Boleh Sama dengan Password Lama',
        );
      } else {
        FormData formData = FormData.fromMap(
          {
            'current_password': currentPasswordController.text,
            'new_password': newPasswordController.text,
          },
        );

        final response = await AuthService.changePassword(
          formData: formData,
        );

        if (response.statusCode == 200) {
          SnackbarWidget.defaultSnackbar(
            icon: Icon(
              Icons.check_circle,
              color: ColorApp.green,
            ),
            title: 'Berhasil!',
            subtitle: 'Password Berhasil Diperbarui',
          );
          currentPasswordController.clear();
          newPasswordController.clear();
        }
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
    currentPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }
}
