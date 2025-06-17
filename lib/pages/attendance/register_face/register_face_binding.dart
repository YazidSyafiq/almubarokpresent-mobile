import 'package:almubarok_present/controllers/attendance_controller.dart';
import 'package:almubarok_present/controllers/register_face_controller.dart';
import 'package:get/get.dart';

class RegisterFaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterFaceController>(() => RegisterFaceController());
    Get.lazyPut<AttendanceController>(() => AttendanceController());
  }
}
