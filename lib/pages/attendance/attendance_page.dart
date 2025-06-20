import 'package:almubarok_present/controllers/attendance_controller.dart';
import 'package:almubarok_present/pages/attendance/widgets/alert_banned.dart';
import 'package:almubarok_present/pages/attendance/widgets/alert_leave.dart';
import 'package:almubarok_present/pages/attendance/widgets/alert_widget.dart';
import 'package:almubarok_present/pages/attendance/widgets/button_check_in_check_out_widget.dart';
import 'package:almubarok_present/pages/attendance/widgets/google_maps_widget.dart';
import 'package:almubarok_present/pages/attendance/widgets/register_face_widget.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/routes/page_names.dart';
import 'package:almubarok_present/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AttendanceController>(
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              Get.offAllNamed(PageName.navTab);
            }
          },
          child: Scaffold(
            backgroundColor: ColorApp.white,
            appBar: AppBarWidget(
              title: 'Attendance',
              leadingIcon: false,
            ),
            body: Obx(
              () {
                if (controller.isLoadingGetSetup.value ||
                    controller.isLoadingGetAttendanceToday.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorApp.colorPrimary,
                    ),
                  );
                } else if (controller.faceEmbedding.value == '') {
                  return RegisterFaceWidget(
                    onTap: () {
                      Get.toNamed(
                        PageName.registerFace,
                      );
                    },
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Obx(
                        () => GoogleMapsWidget(
                          circles: Set.from(controller.circlesGoogleMap),
                          markers: Set.from(controller.markersGoogleMap),
                          completer: controller.completer,
                          polylines: Set.from(controller.polylinesGoogleMap),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Obx(
                        () => Visibility(
                          visible: controller.visibleAlert.value ||
                              controller.isBanned.value ||
                              controller.isLeave.value,
                          child: controller.visibleAlert.value
                              ? AlertWidget()
                              : controller.isLeave.value
                                  ? AlertLeave()
                                  : AlertBanned(),
                        ),
                      ),
                      Obx(
                        () => Visibility(
                          visible: controller.visibleAttendance.value &&
                              !controller.isLeave.value &&
                              !controller.isBanned.value,
                          child: ButtonCheckInCheckOutWidget(
                            controller: controller,
                            isCheckIn: controller.visibleCheckIn.value,
                            isCheckOut: controller.visibleCheckOut.value,
                            onTapCheckIn: () {
                              Get.toNamed(
                                PageName.checkInCheckOut,
                                arguments: {
                                  'check': 'check in',
                                },
                              );
                            },
                            onTapCheckOut: () {
                              Get.toNamed(
                                PageName.checkInCheckOut,
                                arguments: {
                                  'check': 'check out',
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
