import 'package:almubarok_present/models/history_attendance_response_model.dart';
import 'package:almubarok_present/pages/bottom_nav_bar/nav_tab_controller.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/services/api/history_service.dart';
import 'package:almubarok_present/widgets/snackbar_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;

class HistoryController extends GetxController {
  NavTabController navTabController = Get.find();
  HistoryAttendanceResponseModel historyAttendanceThisMonth =
      HistoryAttendanceResponseModel();
  HistoryAttendanceResponseModel historyAttendanceThisYear =
      HistoryAttendanceResponseModel();

  RxBool isLoadingGetMonth = false.obs;
  RxBool isLoadingGetYear = false.obs;

  List<String> months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  Future<void> getAttendanceMonth() async {
    isLoadingGetMonth.value = true;
    try {
      final response = await HistoryService.getAttendanceMonth();
      historyAttendanceThisMonth =
          HistoryAttendanceResponseModel.fromJson(response.data);
    } catch (e) {
      SnackbarWidget.defaultSnackbar(
        icon: Icon(
          Icons.cancel,
          color: ColorApp.red,
        ),
        title: 'Gagal!',
        subtitle: e.toString(),
      );
    } finally {
      isLoadingGetMonth.value = false;
    }
  }

  Future<void> getAttendanceYear({required int month}) async {
    isLoadingGetYear.value = true;
    historyAttendanceThisYear = HistoryAttendanceResponseModel();
    try {
      debugPrint('Silit :${month.toString()}');
      FormData formData = FormData.fromMap(
        {
          'month': month,
        },
      );

      final response = await HistoryService.getAttendanceYear(
        formData: formData,
      );
      historyAttendanceThisYear =
          HistoryAttendanceResponseModel.fromJson(response.data);
    } catch (e) {
      SnackbarWidget.defaultSnackbar(
        icon: Icon(
          Icons.cancel,
          color: ColorApp.red,
        ),
        title: 'Gagal!',
        subtitle: e.toString(),
      );
    } finally {
      isLoadingGetYear.value = false;
    }
  }

  @override
  void onInit() {
    getAttendanceMonth();
    super.onInit();
  }
}
