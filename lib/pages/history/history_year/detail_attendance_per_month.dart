import 'package:almubarok_present/controllers/history_controller.dart';
import 'package:almubarok_present/pages/history/widgets/item_list_attendance.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/widgets/app_bar_widget.dart';
import 'package:almubarok_present/widgets/not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class DetailAttendancePerMonth extends StatelessWidget {
  const DetailAttendancePerMonth({
    super.key,
    required this.month,
  });
  final String month;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorApp.white,
          appBar: AppBarWidget(
            title: month,
            leadingIcon: true,
          ),
          body: Obx(
            () {
              if (controller.isLoadingGetYear.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorApp.colorPrimary,
                  ),
                );
              } else if (controller.historyAttendanceThisYear.data!.isEmpty) {
                return NotFoundWidget();
              } else {
                return Padding(
                  padding: EdgeInsets.only(
                    right: 16,
                    left: 16,
                    top: 2.h,
                  ),
                  child: ListView.builder(
                    itemCount:
                        controller.historyAttendanceThisYear.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final data =
                          controller.historyAttendanceThisYear.data?[index];

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
          ),
        );
      },
    );
  }
}
