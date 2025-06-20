import 'package:almubarok_present/utils/dio.dart';
import 'package:almubarok_present/utils/endpoint.dart';
import 'package:dio/dio.dart';

class AttendanceService {
  static Future<Response> getSetupAttendance() async {
    return DioSetup.getAuth(
      url: Endpoint.getSetupAttendance,
    );
  }

  static Future<Response> registerFace({required FormData formData}) async {
    return DioSetup.postAuth(
      url: Endpoint.registerFace,
      formData: formData,
    );
  }

  static Future<Response> bannedAkun() async {
    return DioSetup.postAuth(
      url: Endpoint.bannedAkun,
    );
  }

  static Future<Response> getAttendanceToday() async {
    return DioSetup.getAuth(
      url: Endpoint.getAttendanceToday,
    );
  }

  static Future<Response> submitAttendance({required FormData formData}) async {
    return DioSetup.postAuth(
      url: Endpoint.submitAttendance,
      formData: formData,
    );
  }
}
