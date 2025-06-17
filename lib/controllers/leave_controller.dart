import 'package:almubarok_present/models/leave_response_model.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/services/api/leave_service.dart';
import 'package:almubarok_present/widgets/snackbar_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;

class LeaveController extends GetxController {
  LeaveResponseModel leaveResponseModel = LeaveResponseModel();
  LeaveResponseModel leaveResponseModelDetail = LeaveResponseModel();

  RxBool isLoadingGetLeave = false.obs;
  RxBool isLoadingRequestLeave = false.obs;
  RxBool isValidate = false.obs;

  TextEditingController dateController = TextEditingController();
  TextEditingController reasonController = TextEditingController();

  RxString selectedDate = ''.obs;

  Future<void> getLeave() async {
    isLoadingGetLeave.value = true;
    leaveResponseModel = LeaveResponseModel();
    try {
      final response = await LeaveService.getLeave();
      leaveResponseModel = LeaveResponseModel.fromJson(response.data);
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
      isLoadingGetLeave.value = false;
    }
  }

  Future<void> getLeaveDetail({required int id}) async {
    isLoadingGetLeave.value = true;
    leaveResponseModelDetail = LeaveResponseModel();
    try {
      final response = await LeaveService.getLeaveDetail(id: id);
      leaveResponseModelDetail = LeaveResponseModel.fromJson(response.data);
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
      isLoadingGetLeave.value = false;
    }
  }

  Future<void> requestLeave() async {
    isLoadingRequestLeave.value = true;
    try {
      FormData formData = FormData.fromMap(
        {
          'date': selectedDate.value,
          'reason': reasonController.text,
        },
      );

      final response = await LeaveService.requestLeave(
        formData: formData,
      );

      if (response.data['success'] == true) {
        SnackbarWidget.defaultSnackbar(
          icon: Icon(
            Icons.check_circle,
            color: ColorApp.green,
          ),
          title: 'Berhasil!',
          subtitle: 'Pengajuan Izin Berhasil!',
        );
      }
      dateController.clear();
      reasonController.clear();
      selectedDate.value = '';
      getLeave();
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
      isLoadingRequestLeave.value = false;
    }
  }

  @override
  void onInit() {
    getLeave();
    dateController.addListener(validate);
    reasonController.addListener(validate);
    super.onInit();
  }

  void validate() {
    if (dateController.text.isNotEmpty && reasonController.text.isNotEmpty) {
      isValidate.value = true;
    } else {
      isValidate.value = false;
    }
  }

  @override
  void dispose() {
    dateController.dispose();
    reasonController.dispose();
    super.dispose();
  }
}
