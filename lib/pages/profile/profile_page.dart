import 'package:almubarok_present/controllers/profile_controller.dart';
import 'package:almubarok_present/pages/profile/widgets/profile_button_widget.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/routes/page_names.dart';
import 'package:almubarok_present/widgets/pop_up_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorApp.white,
          body: SingleChildScrollView(
            child: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Stack(
                children: [
                  Image.asset(
                    appImages.imgBgProfile.path,
                    width: 100.w,
                    height: 25.h,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 20.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: 100.w,
                      height: 100.h - 25.h,
                      decoration: BoxDecoration(
                        color: ColorApp.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(top: 11.h),
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Obx(
                              () {
                                return Column(
                                  children: [
                                    Text(
                                      controller.profile.value.data?.nama ?? '',
                                      style: TextStyleApp.titleText.copyWith(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      controller.profile.value.data?.lkm ?? '',
                                      style: TextStyleApp.bodyText.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      controller.profile.value.data?.kelas ??
                                          '',
                                      style: TextStyleApp.bodyText.copyWith(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            ProfileButtonWidget(
                              onTap: () {
                                Get.toNamed(PageName.personalData);
                              },
                              icon: Icons.person,
                              title: 'Personal Data',
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            ProfileButtonWidget(
                              onTap: () {
                                Get.toNamed(PageName.changePassword);
                              },
                              icon: Icons.lock_person_rounded,
                              title: 'Change Password',
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            ProfileButtonWidget(
                              onTap: () {
                                Get.toNamed(PageName.about);
                              },
                              icon: Icons.info,
                              title: 'About',
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            ProfileButtonWidget(
                              onTap: () {
                                PopUpWidget.alertPopUp(
                                  title: 'Apakah Anda Yakin Ingin Keluar?',
                                  confirm: () {
                                    controller.logout();
                                  },
                                );
                              },
                              icon: Icons.logout_outlined,
                              title: 'Logout',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 11.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 35.w,
                        height: 40.w,
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
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
