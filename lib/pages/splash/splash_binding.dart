import 'package:almubarok_present/controllers/initial_controller.dart';
import 'package:almubarok_present/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<InitialController>(() => InitialController());
  }
}
