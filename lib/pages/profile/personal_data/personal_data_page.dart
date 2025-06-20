import 'package:almubarok_present/controllers/profile_controller.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/routes/page_names.dart';
import 'package:almubarok_present/widgets/app_bar_widget.dart';
import 'package:almubarok_present/widgets/text_form_field_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          controller.getProfile();
        });
        return Scaffold(
          backgroundColor: ColorApp.white,
          appBar: AppBarWidget(
            leadingIcon: true,
            title: 'Personal Data',
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Obx(
                          () {
                            if (controller.isLoadingGetProfile.value) {
                              return Shimmer.fromColors(
                                baseColor: ColorApp.white,
                                highlightColor: ColorApp.grey,
                                child: Container(
                                  color: ColorApp.white,
                                ),
                              );
                            } else {
                              return CachedNetworkImage(
                                imageUrl:
                                    controller.profile.value.data?.imageUrl ??
                                        '',
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: ColorApp.white,
                                  highlightColor: ColorApp.grey,
                                  child: Container(
                                    color: ColorApp.white,
                                  ),
                                ),
                                errorWidget: (context, url, error) => Icon(
                                  Icons.warning_rounded,
                                  size: 48,
                                  color: ColorApp.black,
                                ),
                                width: 35.w,
                                height: 40.w,
                                fit: BoxFit.cover,
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextFormFieldWidget(
                    titleForm: 'Nama',
                    isPassword: false,
                    initialValue: controller.profile.value.data?.nama,
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextFormFieldWidget(
                    titleForm: 'Email',
                    isPassword: false,
                    initialValue: controller.profile.value.data?.email,
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextFormFieldWidget(
                    titleForm: 'No. Telp',
                    isPassword: false,
                    initialValue: controller.profile.value.data?.noTelp,
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextFormFieldWidget(
                    titleForm: 'Lembaga',
                    isPassword: false,
                    initialValue: controller.profile.value.data?.lkm,
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextFormFieldWidget(
                    titleForm: 'Kelas',
                    isPassword: false,
                    initialValue: controller.profile.value.data?.kelas,
                    readOnly: true,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(PageName.editProfile);
            },
            backgroundColor: ColorApp.colorPrimary,
            focusColor: ColorApp.white,
            hoverColor: ColorApp.white,
            splashColor: ColorApp.colorPrimary,
            child: Icon(
              Icons.edit,
              color: ColorApp.white,
            ),
          ),
        );
      },
    );
  }
}
