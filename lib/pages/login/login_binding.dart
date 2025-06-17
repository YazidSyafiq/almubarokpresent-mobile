import 'package:almubarok_present/controllers/initial_controller.dart';
import 'package:almubarok_present/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<InitialController>(() => InitialController());
  }
}
