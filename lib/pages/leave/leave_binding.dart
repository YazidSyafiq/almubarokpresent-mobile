import 'package:almubarok_present/controllers/leave_controller.dart';
import 'package:almubarok_present/pages/bottom_nav_bar/nav_tab_controller.dart';
import 'package:get/get.dart';

class LeaveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaveController>(() => LeaveController());
    Get.lazyPut<NavTabController>(() => NavTabController());
  }
}
