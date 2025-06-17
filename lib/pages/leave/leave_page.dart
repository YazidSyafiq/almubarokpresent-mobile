import 'package:almubarok_present/controllers/leave_controller.dart';
import 'package:almubarok_present/pages/leave/widgets/button_request_widget.dart';
import 'package:almubarok_present/pages/leave/widgets/item_list_leave_widget.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/routes/page_names.dart';
import 'package:almubarok_present/utils/date_format_converter.dart';
import 'package:almubarok_present/widgets/app_bar_widget.dart';
import 'package:almubarok_present/widgets/not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LeavePage extends StatelessWidget {
  const LeavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeaveController>(
      builder: (controller) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          controller.getLeave();
        });
        return Scaffold(
          backgroundColor: ColorApp.white,
          appBar: AppBarWidget(
            title: 'Leave',
            leadingIcon: false,
          ),
          body: Obx(
            () {
              if (controller.isLoadingGetLeave.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorApp.colorPrimary,
                  ),
                );
              } else if (controller.leaveResponseModel.data == null) {
                return NotFoundWidget();
              } else {
                return Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: ListView.builder(
                    itemCount: controller.leaveResponseModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final data = controller.leaveResponseModel.data?[index];

                      return ItemListLeaveWidget(
                        date: data?.date,
                        status: data?.status,
                        onTap: () {
                          Get.toNamed(
                            PageName.leaveDetail,
                            arguments: {
                              'day': DateFormatConverter.convertDayFormat(
                                  data?.date),
                              'date': DateFormatConverter.convertDateFormat(
                                  data?.date),
                              'status': data?.status ?? '-',
                              'reason': data?.reason ?? '-',
                              'note': data?.note ?? '-',
                            },
                          );
                        },
                      );
                    },
                  ),
                );
              }
            },
          ),
          floatingActionButton: ButtonRequestWidget(
            onTap: () {
              Get.toNamed(
                PageName.requestLeave,
              );
            },
          ),
        );
      },
    );
  }
}
