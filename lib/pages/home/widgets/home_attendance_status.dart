import 'package:almubarok_present/controllers/home_controller.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeAttendanceStatus extends StatelessWidget {
  const HomeAttendanceStatus({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Attendance Status',
            style: TextStyleApp.bodyTextBold,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: ColorApp.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [ElevationApp.elevation4pxBottom],
            border: Border.all(
              color: ColorApp.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 1.5.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: ColorApp.colorPrimary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hari Ini',
                              style: TextStyleApp.bodyTextBold.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Obx(
                              () => Text(
                                controller.today.value,
                                style: TextStyleApp.bodyText.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 1.5.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: ColorApp.colorPrimary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Obx(
                                  () => Icon(
                                    Icons.arrow_circle_right_outlined,
                                    color: controller.terlambat.value
                                        ? ColorApp.red
                                        : ColorApp.green,
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    ' ${controller.checkIn.value}',
                                    style: TextStyleApp.bodyText.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Row(
                              children: [
                                Obx(
                                  () => Icon(
                                    Icons.arrow_circle_left_outlined,
                                    color: controller.terlambat.value
                                        ? ColorApp.red
                                        : ColorApp.green,
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    ' ${controller.checkOut.value}',
                                    style: TextStyleApp.bodyText.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 7.5,
                    color: ColorApp.colorPrimary,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Time',
                      style: TextStyleApp.bodyText.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.currentTime.value,
                        style: TextStyleApp.bodyTextBold.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
