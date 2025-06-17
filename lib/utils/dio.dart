import 'package:almubarok_present/services/local/token.dart';
import 'package:dio/dio.dart';

class DioSetup {
  static Dio dio = Dio(
    BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  static Future<void> addAuthHeader() async {
    String? token = await Token.getToken();
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  static Future<Response> getNoAuth(
      {required String url, FormData? formData}) async {
    try {
      final response = await dio.get(
        url,
        data: formData,
      );
      return response;
    } on DioException catch (e) {
      throw throw e.response?.data['message'];
    }
  }

  static Future<Response> postNoAuth(
      {required String url, FormData? formData}) async {
    try {
      final response = await dio.post(
        url,
        data: formData,
      );
      return response;
    } on DioException catch (e) {
      throw throw e.response?.data['message'];
    }
  }

  static Future<Response> putNoAuth(
      {required String url, FormData? formData}) async {
    try {
      final response = await dio.put(
        url,
        data: formData,
      );
      return response;
    } on DioException catch (e) {
      throw throw e.response?.data['message'];
    }
  }

  static Future<Response> deleteNoAuth(
      {required String url, FormData? formData}) async {
    try {
      final response = await dio.delete(
        url,
        data: formData,
      );
      return response;
    } on DioException catch (e) {
      throw throw e.response?.data['message'];
    }
  }

  static Future<Response> getAuth({
    required String url,
    FormData? formData,
  }) async {
    try {
      await addAuthHeader();
      final response = await dio.get(
        url,
        data: formData,
      );
      return response;
    } on DioException catch (e) {
      throw throw e.response?.data['message'];
    }
  }

  static Future<Response> postAuth({
    required String url,
    FormData? formData,
  }) async {
    try {
      await addAuthHeader();
      final response = await dio.post(
        url,
        data: formData,
      );
      return response;
    } on DioException catch (e) {
      throw throw e.response?.data['message'];
    }
  }

  static Future<Response> putAuth({
    required String url,
    FormData? formData,
  }) async {
    try {
      await addAuthHeader();
      final response = await dio.put(
        url,
        data: formData,
      );
      return response;
    } on DioException catch (e) {
      throw throw e.response?.data['message'];
    }
  }

  static Future<Response> deleteAuth({
    required String url,
    FormData? formData,
  }) async {
    try {
      await addAuthHeader();
      final response = await dio.delete(
        url,
        data: formData,
      );
      return response;
    } on DioException catch (e) {
      throw throw e.response?.data['message'];
    }
  }
}
