import 'package:almubarok_present/controllers/on_boarding_controller.dart';
import 'package:almubarok_present/pages/onboarding/widgets/on_boarding_item.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      body: GetBuilder<OnBoardingController>(
        builder: (controller) {
          return Stack(
            children: [
              PageView(
                controller: controller.pageController,
                onPageChanged: (value) {
                  controller.onPageChanged(value);
                },
                children: [
                  OnBoardingItem(
                    title: 'Selamat Datang\nDi Al Mubarok Present App',
                    image: appImages.illOnBoarding1.path,
                  ),
                  OnBoardingItem(
                    title: 'Tepat Waktu Adalah Kunci',
                    image: appImages.illOnBoarding2.path,
                    subtitle:
                        'Al Mubarok Present hadir sebagai solusi presensi yang efektif dan efisien untuk kelancaran proses belajar mengajar',
                  ),
                  OnBoardingItem(
                    title: 'Semua History Presensi Tercatat',
                    image: appImages.illOnBoarding3.path,
                    subtitle:
                        'Pantau semua riwayat presensi Anda dengan mudah dan terorganisir dalam satu aplikasi',
                  ),
                ],
              ),
              Obx(
                () => Visibility(
                  visible: controller.currentPage.value != 2,
                  child: Positioned(
                    right: 16,
                    top: 45,
                    child: TextButton(
                      onPressed: () {
                        controller.pageController.jumpToPage(2);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorApp.colorPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 12.5.h,
                left: 16,
                right: 16,
                child: Center(
                  child: SmoothPageIndicator(
                    controller: controller.pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      dotColor: ColorApp.grey,
                      activeDotColor: ColorApp.colorPrimary,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 2.h,
                right: 16,
                left: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => controller.currentPage.value != 0
                          ? IconButton(
                              onPressed: () {
                                controller.pageController.previousPage(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.linear,
                                );
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: ColorApp.colorPrimary,
                              ),
                            )
                          : IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.transparent,
                              ),
                              highlightColor: Colors.transparent,
                            ),
                    ),
                    Obx(
                      () => controller.currentPage.value != 2
                          ? IconButton(
                              onPressed: () {
                                controller.pageController.nextPage(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.linear,
                                );
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: ColorApp.colorPrimary,
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                controller.getStarted();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorApp.colorPrimary,
                              ),
                              child: Text(
                                'Get Started',
                                style: TextStyleApp.bodyTextBold.copyWith(
                                  color: ColorApp.white,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
