import 'dart:io';

import 'package:almubarok_present/controllers/home_controller.dart';
import 'package:almubarok_present/pages/home/widgets/home_attendance_status.dart';
import 'package:almubarok_present/pages/home/widgets/home_carousel_widget.dart';
import 'package:almubarok_present/pages/home/widgets/home_fitur_utama_widget.dart';
import 'package:almubarok_present/pages/home/widgets/home_profile_widget.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              if (controller.navTabController.tabIndex.value == 0) {
                if (Platform.isAndroid) {
                  SystemNavigator.pop();
                } else if (Platform.isIOS) {
                  exit(0);
                }
              }
            }
          },
          child: Scaffold(
            backgroundColor: ColorApp.white,
            body: Obx(() {
              if (controller.profileController.isLoadingGetProfile.value ||
                  controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorApp.colorPrimary,
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeProfileWidget(
                        controller: controller,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      HomeCarouselWidget(
                        controller: controller,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      HomeFiturUtamaWidget(
                        controller: controller,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      HomeAttendanceStatus(controller: controller),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                );
              }
            }),
          ),
        );
      },
    );
  }
}
