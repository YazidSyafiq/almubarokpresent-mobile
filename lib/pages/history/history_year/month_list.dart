import 'package:almubarok_present/controllers/history_controller.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/routes/page_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MonthList extends StatelessWidget {
  const MonthList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: ListView.builder(
            itemCount: controller.months.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  controller.getAttendanceYear(
                    month: index + 1,
                  );
                  Get.toNamed(
                    PageName.historyDetail,
                    arguments: {
                      'month': controller.months[index],
                    },
                  );
                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 55,
                  margin: EdgeInsets.only(bottom: 2.h, left: 8, right: 8),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: ColorApp.colorPrimary,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [ElevationApp.elevation4pxBottom],
                    image: DecorationImage(
                      image: AssetImage(
                        appImages.imgBgProfile.path,
                      ),
                      fit: BoxFit.cover,
                      opacity: 0.3,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: ColorApp.white,
                        size: 30,
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        controller.months[index],
                        style: TextStyleApp.bodyTextBold.copyWith(
                          fontSize: 18,
                          color: ColorApp.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
