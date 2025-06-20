import 'package:almubarok_present/controllers/attendance_controller.dart';
import 'package:almubarok_present/controllers/check_in_check_out_controller.dart';
import 'package:get/get.dart';

class CheckInCheckOutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceController>(() => AttendanceController());
    Get.lazyPut<CheckInCheckOutController>(() => CheckInCheckOutController());
  }
}
