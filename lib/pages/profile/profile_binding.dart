import 'package:almubarok_present/controllers/initial_controller.dart';
import 'package:almubarok_present/controllers/profile_controller.dart';
import 'package:almubarok_present/pages/bottom_nav_bar/nav_tab_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<InitialController>(() => InitialController());
    Get.lazyPut<NavTabController>(() => NavTabController());
  }
}
