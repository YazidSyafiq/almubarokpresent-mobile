import 'package:almubarok_present/controllers/change_password_controller.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/widgets/app_bar_widget.dart';
import 'package:almubarok_present/widgets/loading_overlay.dart';
import 'package:almubarok_present/widgets/save_button_widget.dart';
import 'package:almubarok_present/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorApp.white,
          appBar: AppBarWidget(
            title: 'Change Password',
            leadingIcon: true,
          ),
          body: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    SizedBox(height: 2.h),
                    TextFormFieldWidget(
                      textEditingController:
                          controller.currentPasswordController,
                      titleForm: 'Current Password',
                      isPassword: true,
                    ),
                    SizedBox(height: 3.h),
                    TextFormFieldWidget(
                      textEditingController: controller.newPasswordController,
                      titleForm: 'New Password',
                      isPassword: true,
                    ),
                    SizedBox(height: 5.h),
                    Visibility(
                      visible: controller
                              .currentPasswordController.text.isNotEmpty &&
                          controller.newPasswordController.text.isNotEmpty,
                      child: SaveButtonWidget(
                        onTap: () {
                          controller.changePassword();
                        },
                      ),
                    )
                  ],
                ),
              ),
              if (controller.isLoading.value) LoadingOverlay(),
            ],
          ),
        );
      },
    );
  }
}
