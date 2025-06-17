import 'package:almubarok_present/utils/dio.dart';
import 'package:almubarok_present/utils/endpoint.dart';
import 'package:dio/dio.dart';

class LeaveService {
  static Future<Response> getLeave() async {
    return DioSetup.getAuth(
      url: Endpoint.getLeave,
    );
  }

  static Future<Response> getLeaveDetail({
    required int id,
  }) async {
    return DioSetup.getAuth(
      url: '${Endpoint.getLeaveDetail}/$id',
    );
  }

  static Future<Response> requestLeave({
    required FormData formData,
  }) async {
    return DioSetup.postAuth(
      url: Endpoint.requestLeave,
      formData: formData,
    );
  }
}
