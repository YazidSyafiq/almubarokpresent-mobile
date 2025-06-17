import 'package:almubarok_present/controllers/history_controller.dart';
import 'package:almubarok_present/pages/history/widgets/item_list_attendance.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/widgets/not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ListHistoryMonth extends StatelessWidget {
  const ListHistoryMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      builder: (controller) {
        return Obx(
          () {
            if (controller.isLoadingGetMonth.value) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorApp.colorPrimary,
                ),
              );
            } else if (controller.historyAttendanceThisMonth.data?.isEmpty ??
                false) {
              return NotFoundWidget();
            } else {
              return Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: ListView.builder(
                  itemCount:
                      controller.historyAttendanceThisMonth.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final data =
                        controller.historyAttendanceThisMonth.data?[index];

                    return ItemListAttendance(
                      day: data?.date,
                      date: data?.date,
                      checkInTime: data?.checkInTime,
                      checkOutTime: data?.checkOutTime,
                      status: data?.status,
                    );
                  },
                ),
              );
            }
          },
        );
      },
    );
  }
}
