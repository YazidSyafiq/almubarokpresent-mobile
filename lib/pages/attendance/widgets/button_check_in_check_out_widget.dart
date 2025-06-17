import 'package:almubarok_present/controllers/attendance_controller.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ButtonCheckInCheckOutWidget extends StatelessWidget {
  const ButtonCheckInCheckOutWidget({
    super.key,
    required this.isCheckIn,
    required this.isCheckOut,
    required this.onTapCheckIn,
    required this.onTapCheckOut,
    required this.controller,
  });

  final bool isCheckIn;
  final bool isCheckOut;
  final void Function() onTapCheckIn;
  final void Function() onTapCheckOut;
  final AttendanceController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorApp.white,
        boxShadow: [ElevationApp.elevation4pxBottom],
        border: Border.all(
          color: ColorApp.grey.withOpacity(0.3),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Attendance Time',
              style: TextStyleApp.bodyText,
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Obx(
              () => Text(
                '${controller.timeNow.value} WIB',
                style: TextStyleApp.bodyTextBold.copyWith(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Obx(
              () => Text(
                controller.dateNow.value,
                style: TextStyleApp.bodyText,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: isCheckIn ? onTapCheckIn : null,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 37.5.w,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isCheckIn ? ColorApp.green : ColorApp.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Check In',
                        style: TextStyleApp.bodyTextBold.copyWith(
                          color: ColorApp.white,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: isCheckOut ? onTapCheckOut : null,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 37.5.w,
                    height: 50,
                    decoration: BoxDecoration(
                      color: isCheckOut ? ColorApp.red : ColorApp.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Check Out',
                        style: TextStyleApp.bodyTextBold.copyWith(
                          color: ColorApp.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
