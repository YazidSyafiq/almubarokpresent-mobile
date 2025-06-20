import 'package:almubarok_present/controllers/leave_controller.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/utils/date_format_converter.dart';
import 'package:almubarok_present/widgets/app_bar_widget.dart';
import 'package:almubarok_present/widgets/save_button_widget.dart';
import 'package:almubarok_present/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class RequestLeavePage extends StatelessWidget {
  const RequestLeavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeaveController>(
      builder: (controller) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              controller.getLeave();
              Get.back();
            }
          },
          child: Scaffold(
            backgroundColor: ColorApp.white,
            appBar: AppBarWidget(
              title: 'Request Leave',
              leadingIcon: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              child: Column(
                children: [
                  TextFormFieldWidget(
                    textEditingController: controller.dateController,
                    titleForm: 'Tanggal',
                    readOnly: true,
                    isTanggal: true,
                    onTapTanggal: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(
                          Duration(
                            days: 7,
                          ),
                        ),
                        locale: Locale(
                          'id',
                          'ID',
                        ),
                      );

                      if (selectedDate != null) {
                        controller.selectedDate.value =
                            DateFormatConverter.convertDateFormatSubmit(
                                selectedDate);
                        controller.dateController.text =
                            DateFormatConverter.convertDateFormat(selectedDate);
                      }
                    },
                    isPassword: false,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextFormFieldWidget(
                    textEditingController: controller.reasonController,
                    titleForm: 'Alasan',
                    isPassword: false,
                    maxLines: 8,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.isValidate.value,
                      child: SaveButtonWidget(
                        isRequest: true,
                        onTap: () {
                          controller.requestLeave();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
