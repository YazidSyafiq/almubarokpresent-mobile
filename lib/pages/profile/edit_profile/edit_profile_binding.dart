import 'package:almubarok_present/controllers/edit_profile_controller.dart';
import 'package:almubarok_present/controllers/profile_controller.dart';
import 'package:get/get.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
