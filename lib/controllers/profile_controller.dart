import 'package:almubarok_present/controllers/initial_controller.dart';
import 'package:almubarok_present/models/profile_response_model.dart';
import 'package:almubarok_present/pages/bottom_nav_bar/nav_tab_controller.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/services/api/auth_service.dart';
import 'package:almubarok_present/services/api/profile_service.dart';
import 'package:almubarok_present/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  NavTabController navTabController = Get.find();
  Rx<ProfileResponseModel> profile = ProfileResponseModel().obs;
  RxBool isLoadingGetProfile = false.obs;
  InitialController initialController = Get.find();

  Future<void> getProfile() async {
    isLoadingGetProfile.value = true;
    try {
      final response = await ProfileService.getProfile();
      profile.value = ProfileResponseModel.fromJson(response.data);
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
      isLoadingGetProfile.value = false;
    }
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  Future<void> logout() async {
    try {
      final response = await AuthService.logout();
      if (response.statusCode == 200) {
        initialController.logout();
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
    }
  }
}
