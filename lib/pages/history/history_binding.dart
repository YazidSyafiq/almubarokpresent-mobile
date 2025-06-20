import 'package:almubarok_present/controllers/history_controller.dart';
import 'package:almubarok_present/pages/bottom_nav_bar/nav_tab_controller.dart';
import 'package:get/get.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<NavTabController>(() => NavTabController());
  }
}
