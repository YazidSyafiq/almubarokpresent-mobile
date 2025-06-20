import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarWidget {
  static void defaultSnackbar({
    RxBool? isDissmiss,
    required Widget icon,
    required String title,
    required String subtitle,
  }) {
    Get.snackbar(title, subtitle,
        snackPosition: SnackPosition.BOTTOM,
        icon: icon,
        backgroundColor: ColorApp.white,
        borderRadius: 12,
        margin: const EdgeInsets.all(20),
        colorText: ColorApp.black,
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        forwardAnimationCurve: Curves.easeOutBack,
        snackbarStatus: (status) => status == SnackbarStatus.CLOSED
            ? isDissmiss?.value = false
            : isDissmiss?.value = true,
        boxShadows: [ElevationApp.elevation4pxBottom]);
  }
}
