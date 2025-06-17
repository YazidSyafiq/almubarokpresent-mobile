import 'package:almubarok_present/controllers/splash_controller.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorApp.colorPrimary,
          body: Stack(
            children: [
              SizedBox(
                width: 100.w,
                height: 100.h,
                child: Center(
                  child: Image.asset(
                    appImages.imgLogoPutih.path,
                    width: 50.w,
                  ),
                ),
              ),
              Obx(
                () => Positioned(
                  left: 16,
                  right: 16,
                  bottom: 2.5.h,
                  child: Text(
                    'Copyright © 2024\n Version ${controller.version.value}',
                    style: TextStyleApp.bodyTextSmall.copyWith(
                      color: ColorApp.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
