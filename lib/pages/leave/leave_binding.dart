import 'package:almubarok_present/controllers/leave_controller.dart';
import 'package:get/get.dart';

class LeaveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaveController>(() => LeaveController());
  }
}
