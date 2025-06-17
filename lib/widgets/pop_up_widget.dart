import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class PopUpWidget {
  static Future<dynamic> alertPopUp({
    required String title,
    required Function() confirm,
  }) {
    return Get.defaultDialog(
      backgroundColor: ColorApp.white,
      title: '',
      content: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Lottie.asset(
              appImages.animationWarningLottie,
              width: 50.w,
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              title,
              style: TextStyleApp.bodyText,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: 30.w,
                    height: 60,
                    decoration: BoxDecoration(
                      color: ColorApp.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyleApp.bodyTextBold.copyWith(
                          fontSize: 16,
                          color: ColorApp.black,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: confirm,
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: 30.w,
                    height: 60,
                    decoration: BoxDecoration(
                      color: ColorApp.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: TextStyleApp.bodyTextBold.copyWith(
                          fontSize: 16,
                          color: ColorApp.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  static Future<dynamic> alertPopUpFakeGPS({
    required Function() confirm,
  }) {
    return Get.defaultDialog(
      backgroundColor: ColorApp.white,
      title: '',
      content: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Lottie.asset(
              appImages.animationWarningLottie,
              width: 50.w,
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              'Fake GPS Detection!',
              style: TextStyleApp.bodyText,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              'Akun Anda ditangguhkan! Hubungi Admin untuk dibukakan akses presensi dan pastikan Anda tidak menggunakan Fake GPS lagi!',
              style: TextStyleApp.bodyTextSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 3.h,
            ),
            InkWell(
              onTap: confirm,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: ColorApp.green,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Confirm',
                    style: TextStyleApp.bodyTextBold.copyWith(
                      fontSize: 16,
                      color: ColorApp.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
