import 'package:almubarok_present/utils/dio.dart';
import 'package:almubarok_present/utils/endpoint.dart';
import 'package:dio/dio.dart';

class HistoryService {
  static Future<Response> getAttendanceMonth() async {
    return DioSetup.getAuth(
      url: Endpoint.getAttendanceMonth,
    );
  }

  static Future<Response> getAttendanceYear({
    required FormData formData,
  }) async {
    return DioSetup.postAuth(
      url: Endpoint.getAttendanceYear,
      formData: formData,
    );
  }
}
