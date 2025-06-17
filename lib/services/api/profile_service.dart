import 'package:almubarok_present/utils/dio.dart';
import 'package:almubarok_present/utils/endpoint.dart';
import 'package:dio/dio.dart';

class ProfileService {
  static Future<Response> getProfile() async {
    return DioSetup.getAuth(
      url: Endpoint.getProfile,
    );
  }

  static Future<Response> updateProfile({
    required FormData formData,
  }) async {
    return DioSetup.postAuth(
      url: Endpoint.updateProfile,
      formData: formData,
    );
  }
}
