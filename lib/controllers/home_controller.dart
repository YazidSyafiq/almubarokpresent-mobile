import 'package:almubarok_present/controllers/profile_controller.dart';
import 'package:almubarok_present/models/attendance_today_response_model.dart';
import 'package:almubarok_present/pages/bottom_nav_bar/nav_tab_controller.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/services/api/attendance_service.dart';
import 'package:almubarok_present/utils/date_format_converter.dart';
import 'package:almubarok_present/widgets/snackbar_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  ProfileController profileController = Get.find();
  NavTabController navTabController = Get.find();

  RxString greating = ''.obs;
  RxInt activeIndex = 0.obs;
  CarouselSliderController? carouselController;
  RxString today = ''.obs;
  RxString checkIn = ''.obs;
  RxString checkOut = ''.obs;
  RxString currentTime = ''.obs;
  RxBool terlambat = false.obs;

  AttendanceTodayResponseModel attendanceTodayResponseModel =
      AttendanceTodayResponseModel();

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    greatingFunction();
    getDate();
    startClock();
    getAttendanceToday();
    super.onInit();
  }

  Future<void> getAttendanceToday() async {
    isLoading.value = true;
    try {
      final response = await AttendanceService.getAttendanceToday();
      attendanceTodayResponseModel =
          AttendanceTodayResponseModel.fromJson(response.data);

      String masuk = DateFormatConverter.convertTimeFormat(
        attendanceTodayResponseModel.data?.checkInTime,
      );
      String keluar = DateFormatConverter.convertTimeFormat(
        attendanceTodayResponseModel.data?.checkOutTime,
      );

      if (attendanceTodayResponseModel.data?.status == 'Terlambat') {
        terlambat.value = true;
      }

      if (masuk == '-') {
        checkIn.value = 'Belum Check In';
      } else {
        checkIn.value = masuk;
      }

      if (keluar == '-') {
        checkOut.value = 'Belum Check Out';
      } else {
        checkOut.value = keluar;
      }
    } catch (e) {
      SnackbarWidget.defaultSnackbar(
        icon: Icon(
          Icons.cancel,
          color: ColorApp.red,
        ),
        title: "Gagal!",
        subtitle: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  void greatingFunction() {
    int currentHour = DateTime.now().hour;

    if (currentHour >= 5 && currentHour < 11) {
      greating.value = 'Selamat Pagi, \n';
    } else if (currentHour >= 11 && currentHour < 15) {
      greating.value = 'Selamat Siang, \n';
    } else if (currentHour >= 15 && currentHour < 18) {
      greating.value = 'Selamat Sore, \n';
    } else {
      greating.value = 'Selamat Malam, \n';
    }
  }

  String getDate() {
    String day = DateFormatConverter.convertDayFormat(DateTime.now());
    String date = DateFormatConverter.convertDateFormat2(DateTime.now());

    today.value = '$day, $date';
    return today.value;
  }

  void startClock() {
    // Perbarui waktu setiap detik
    currentTime.value = getFormattedTime();
    Future.delayed(const Duration(seconds: 1), () {
      startClock();
    });
  }

  String getFormattedTime() {
    final now = DateTime.now();
    return DateFormat('HH:mm', 'id_ID').format(now);
  }
}
