import 'dart:io';

import 'package:almubarok_present/controllers/profile_controller.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/services/api/profile_service.dart';
import 'package:almubarok_present/widgets/snackbar_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  ProfileController profileController = Get.find();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxString imageUrl = ''.obs;
  Rx<File?> imageFile = Rxn<File>();
  RxBool isLoading = false.obs;

  void initialValue() {
    nameController.text = profileController.profile.value.data?.nama ?? '';
    emailController.text = profileController.profile.value.data?.email ?? '';
    phoneController.text = profileController.profile.value.data?.noTelp ?? '';
    imageUrl.value = profileController.profile.value.data?.imageUrl ?? '';
  }

  @override
  void onInit() {
    initialValue();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void onCameraView() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  void onGalleryView() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  Future<void> updateProfile() async {
    isLoading.value = true;
    try {
      FormData formData = FormData.fromMap(
        {
          'name': nameController.text,
          'email': emailController.text,
          'phone': phoneController.text,
          'image': imageFile.value == null
              ? null
              : await MultipartFile.fromFile(
                  imageFile.value!.path,
                  filename: imageFile.value!.path.split('/').last,
                ),
        },
      );

      final response = await ProfileService.updateProfile(
        formData: formData,
      );

      if (response.statusCode == 200) {
        SnackbarWidget.defaultSnackbar(
          icon: Icon(
            Icons.check_circle,
            color: ColorApp.green,
          ),
          title: 'Berhasil!',
          subtitle: 'Perubahan Profil Berhasil Disimpan',
        );
      }
      profileController.getProfile();
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
}
