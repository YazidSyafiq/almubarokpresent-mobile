import 'package:almubarok_present/controllers/history_controller.dart';
import 'package:almubarok_present/controllers/home_controller.dart';
import 'package:almubarok_present/controllers/initial_controller.dart';
import 'package:almubarok_present/controllers/leave_controller.dart';
import 'package:almubarok_present/controllers/profile_controller.dart';
import 'package:almubarok_present/pages/bottom_nav_bar/nav_tab_controller.dart';
import 'package:get/get.dart';

class NavTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialController>(() => InitialController());
    Get.lazyPut<NavTabController>(() => NavTabController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<LeaveController>(() => LeaveController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
