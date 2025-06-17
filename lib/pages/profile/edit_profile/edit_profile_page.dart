import 'package:almubarok_present/controllers/edit_profile_controller.dart';
import 'package:almubarok_present/pages/profile/edit_profile/widgets/bottom_sheet_pick_image_widget.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/widgets/app_bar_widget.dart';
import 'package:almubarok_present/widgets/loading_overlay.dart';
import 'package:almubarok_present/widgets/save_button_widget.dart';
import 'package:almubarok_present/widgets/text_form_field_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorApp.white,
          appBar: AppBarWidget(
            title: 'Edit Profile',
            leadingIcon: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Center(
                        child: Container(
                          width: 30.w,
                          height: 35.w,
                          decoration: BoxDecoration(
                            color: ColorApp.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              ElevationApp.elevation4pxBottom,
                            ],
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Obx(
                                  () {
                                    if (controller.profileController
                                        .isLoadingGetProfile.value) {
                                      return Shimmer.fromColors(
                                        baseColor: ColorApp.white,
                                        highlightColor: ColorApp.grey,
                                        child: Container(
                                          color: ColorApp.white,
                                        ),
                                      );
                                    } else {
                                      if (controller.imageFile.value != null) {
                                        return Image.file(
                                          controller.imageFile.value!,
                                          width: 35.w,
                                          height: 40.w,
                                          fit: BoxFit.cover,
                                        );
                                      } else {
                                        return CachedNetworkImage(
                                          imageUrl: controller.imageUrl.value,
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            baseColor: ColorApp.white,
                                            highlightColor: ColorApp.grey,
                                            child: Container(
                                              color: ColorApp.white,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(
                                            Icons.warning_rounded,
                                            size: 48,
                                            color: ColorApp.black,
                                          ),
                                          width: 35.w,
                                          height: 40.w,
                                          fit: BoxFit.cover,
                                        );
                                      }
                                    }
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 9.w,
                                  height: 9.w,
                                  decoration: BoxDecoration(
                                    color: ColorApp.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Get.bottomSheet(
                                        BottomSheetPickImageWidget(
                                          cameraPick: () async {
                                            Get.back();
                                            controller.onCameraView();
                                          },
                                          galleryPick: () async {
                                            Get.back();
                                            controller.onGalleryView();
                                          },
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.camera_alt_rounded,
                                      size: 5.w,
                                      color: ColorApp.colorPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      TextFormFieldWidget(
                        titleForm: 'Nama',
                        isPassword: false,
                        textEditingController: controller.nameController,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      TextFormFieldWidget(
                        titleForm: 'Email',
                        isPassword: false,
                        textEditingController: controller.emailController,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      TextFormFieldWidget(
                        titleForm: 'No. Telp',
                        isPassword: false,
                        textEditingController: controller.phoneController,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SaveButtonWidget(
                        isRequest: false,
                        onTap: () {
                          controller.updateProfile();
                        },
                      ),
                    ],
                  ),
                  if (controller.isLoading.value ||
                      controller.profileController.isLoadingGetProfile.value)
                    LoadingOverlay(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
