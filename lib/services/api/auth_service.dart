import 'package:almubarok_present/utils/dio.dart';
import 'package:almubarok_present/utils/endpoint.dart';
import 'package:dio/dio.dart';

class AuthService {
  static Future<Response> login({
    required FormData formData,
  }) async {
    return DioSetup.postNoAuth(
      url: Endpoint.login,
      formData: formData,
    );
  }

  static Future<Response> changePassword({
    required FormData formData,
  }) async {
    return DioSetup.postAuth(
      url: Endpoint.changePassword,
      formData: formData,
    );
  }

  static Future<Response> registerFCMToken({
    required FormData formData,
  }) async {
    return DioSetup.postAuth(
      url: Endpoint.registerFCMToken,
      formData: formData,
    );
  }

  static Future<Response> logout() async {
    return DioSetup.postAuth(
      url: Endpoint.logout,
    );
  }
}
