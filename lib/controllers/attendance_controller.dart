// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:ui' as ui;
import 'package:almubarok_present/models/attendance_today_response_model.dart';
import 'package:almubarok_present/models/setup_attendance_response_model.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/routes/page_names.dart';
import 'package:almubarok_present/services/api/attendance_service.dart';
import 'package:almubarok_present/widgets/pop_up_widget.dart';
import 'package:almubarok_present/widgets/snackbar_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart' hide FormData;
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_map;
import 'package:intl/intl.dart';

class AttendanceController extends GetxController {
  Completer<google_map.GoogleMapController> completer = Completer();
  final double zoom = 18;

  RxSet<google_map.Marker> markersGoogleMap = <google_map.Marker>{}.obs;
  RxSet<google_map.Circle> circlesGoogleMap = <google_map.Circle>{}.obs;
  RxSet<google_map.Polyline> polylinesGoogleMap = <google_map.Polyline>{}.obs;

  SetupAttendanceResponseModel setupAttendanceResponseModel =
      SetupAttendanceResponseModel();
  AttendanceTodayResponseModel attendanceTodayResponseModel =
      AttendanceTodayResponseModel();

  RxBool isLoadingGetAttendanceToday = false.obs;
  RxBool isLoadingGetSetup = false.obs;
  RxString faceEmbedding = ''.obs;
  RxBool visibleAlert = false.obs;
  RxBool visibleAttendance = false.obs;
  RxBool visibleCheckIn = false.obs;
  RxBool visibleCheckOut = false.obs;
  RxBool isUseFakeGps = false.obs;
  RxBool isBanned = false.obs;
  RxBool isLeave = false.obs;

  RxString timeNow = ''.obs;
  RxString dateNow = ''.obs;

  @override
  void onInit() async {
    startClock();
    await getSetupAttendance();
    await getAttendanceToday();
    await determinePosition();
    await bannedAkun();

    super.onInit();
  }

  Future<void> bannedAkun() async {
    try {
      Position position = await Geolocator.getCurrentPosition();

      isUseFakeGps.value = position.isMocked;

      if (isUseFakeGps.value) {
        PopUpWidget.alertPopUpFakeGPS(
          confirm: () {
            Get.offAllNamed(PageName.navTab);
          },
        );
        await AttendanceService.bannedAkun();
        isBanned.value = true;
      } else {
        isBanned.value = false;
      }
    } catch (e, stackTrace) {
      debugPrint('Error: $e');
      debugPrint('StackTrace: $stackTrace');

      debugPrint(e.toString());
      SnackbarWidget.defaultSnackbar(
        icon: Icon(
          Icons.cancel,
          color: ColorApp.red,
        ),
        title: "Gagal!",
        subtitle: e.toString(),
      );
    }
  }

  void resetCompleter() {
    if (completer.isCompleted) {
      completer = Completer<google_map.GoogleMapController>();
    }
  }

  void startClock() {
    // Perbarui waktu setiap detik
    timeNow.value = getFormattedTime();
    dateNow.value =
        DateFormat('EEEE, d MMM yyyy', 'id_ID').format(DateTime.now());
    Future.delayed(const Duration(seconds: 1), () {
      startClock();
    });
  }

  String getFormattedTime() {
    final now = DateTime.now();
    return DateFormat('HH:mm', 'id_ID').format(now);
  }

  Future<void> getAttendanceToday() async {
    isLoadingGetAttendanceToday.value = true;
    try {
      final response = await AttendanceService.getAttendanceToday();
      attendanceTodayResponseModel =
          AttendanceTodayResponseModel.fromJson(response.data);

      if (attendanceTodayResponseModel.data != null) {
        visibleCheckIn.value =
            attendanceTodayResponseModel.data!.permissionCheckIn!;
        visibleCheckOut.value =
            attendanceTodayResponseModel.data!.permissionCheckOut!;
        isBanned.value = attendanceTodayResponseModel.data!.isBanned!;
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
      isLoadingGetAttendanceToday.value = false;
    }
  }

  Future<void> getSetupAttendance() async {
    isLoadingGetSetup.value = true;
    setupAttendanceResponseModel = SetupAttendanceResponseModel();
    try {
      final response = await AttendanceService.getSetupAttendance();
      setupAttendanceResponseModel = SetupAttendanceResponseModel.fromJson(
        response.data,
      );
      faceEmbedding.value =
          setupAttendanceResponseModel.data?.faceEmbedding ?? '';
      isBanned.value = setupAttendanceResponseModel.data?.isBanned ?? false;
      isLeave.value = setupAttendanceResponseModel.data?.leaveApproved ?? false;

      getLastPosition(
        setupAttendanceResponseModel.data?.latitude ?? 0,
        setupAttendanceResponseModel.data?.longitude ?? 0,
        setupAttendanceResponseModel.data?.radius ?? 10,
      );
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
      isLoadingGetSetup.value = false;
    }
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position position;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      SnackbarWidget.defaultSnackbar(
        icon: Icon(
          Icons.cancel,
          color: ColorApp.red,
        ),
        title: "Gagal!",
        subtitle: "Lokasi anda dinonaktifkan",
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      SnackbarWidget.defaultSnackbar(
          icon: Icon(
            Icons.cancel,
            color: ColorApp.red,
          ),
          title: "Gagal!",
          subtitle:
              "Izin lokasi ditolak secara permanen, kami tidak dapat meminta izin.");
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        SnackbarWidget.defaultSnackbar(
          icon: Icon(
            Icons.cancel,
            color: ColorApp.red,
          ),
          title: "Gagal!",
          subtitle: "Izin lokasi ditolak (actual value: $permission)",
        );
      }
    }

    position = await Geolocator.getCurrentPosition();
    return position;
  }

  void getLastPosition(double endLat, double endLng, int radius) async {
    try {
      // Pastikan lokasi saat ini diambil terlebih dahulu
      Position currentPosition = await determinePosition();

      // Fallback jika posisi terakhir tidak tersedia
      Position position = await Geolocator.getLastKnownPosition() ??
          currentPosition; // Gunakan posisi saat ini jika posisi terakhir tidak ada

      final google_map.GoogleMapController googleMapController =
          await completer.future;
      double lat = position.latitude;
      double long = position.longitude;

      // Periksa jarak dan tambahkan marker & circle
      getDistancePosition(lat, long, endLat, endLng, radius);
      googleMapController.animateCamera(
        google_map.CameraUpdate.newLatLngZoom(
          google_map.LatLng(endLat, endLng),
          zoom,
        ),
      );
    } catch (e) {
      SnackbarWidget.defaultSnackbar(
        icon: Icon(
          Icons.cancel,
          color: ColorApp.red,
        ),
        title: "Gagal!",
        subtitle: "Gagal mendapatkan posisi: ${e.toString()}",
      );
    }
  }

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  Future getDistancePosition(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
    int radius,
  ) async {
    final Uint8List? markerIcon = await getBytesFromAsset(
      'assets/images/ic_pin_map.png',
      100,
    );

    double distanceInMeters = Geolocator.distanceBetween(
      startLat,
      startLng,
      endLat,
      endLng,
    );

    markersGoogleMap.clear();
    markersGoogleMap.add(
      google_map.Marker(
        markerId: google_map.MarkerId('$endLat, $endLng'),
        position: google_map.LatLng(
          endLat,
          endLng,
        ),
        icon: google_map.BitmapDescriptor.fromBytes(markerIcon!),
      ),
    );
    circlesGoogleMap.clear();
    circlesGoogleMap.add(
      google_map.Circle(
        circleId: google_map.CircleId('$endLat, $endLng'),
        center: google_map.LatLng(endLat, endLng),
        radius: radius.toDouble(),
        strokeColor: Colors.pink,
        strokeWidth: 1,
        fillColor: Colors.pink[100]!.withOpacity(0.5),
      ),
    );

    if (distanceInMeters >= radius) {
      visibleAlert.value = true;
      visibleAttendance.value = false;
    } else {
      visibleAlert.value = false;
      visibleAttendance.value = true;
    }
  }

  Future<void> submitAttendance() async {
    try {
      Position? position = await Geolocator.getLastKnownPosition();

      FormData formData = FormData.fromMap(
        {
          'latitude': position?.latitude ?? 0,
          'longitude': position?.longitude ?? 0,
        },
      );
      final response = await AttendanceService.submitAttendance(
        formData: formData,
      );

      if (response.data['success'] == true) {
        SnackbarWidget.defaultSnackbar(
          icon: Icon(
            Icons.check_circle,
            color: ColorApp.green,
          ),
          title: 'Berhasil!',
          subtitle: 'Presensi Anda berhasil!',
        );
      }
      getAttendanceToday();
      Get.offAllNamed(PageName.attendance);
    } catch (e) {
      SnackbarWidget.defaultSnackbar(
        icon: Icon(
          Icons.cancel,
          color: ColorApp.red,
        ),
        title: "Gagal!",
        subtitle: e.toString(),
      );
    }
  }
}
