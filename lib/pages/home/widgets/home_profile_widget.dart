import 'package:almubarok_present/controllers/home_controller.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class HomeProfileWidget extends StatelessWidget {
  const HomeProfileWidget({super.key, required this.controller});
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          Image.asset(
            appImages.imgLogoHorizontal.path,
            width: 50.w,
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 24,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            decoration: BoxDecoration(
              color: ColorApp.white,
              borderRadius: BorderRadius.circular(15),
              border: Border(
                left: BorderSide(
                  color: ColorApp.colorPrimary,
                  width: 5,
                ),
              ),
              boxShadow: [ElevationApp.elevation4pxBottom],
              image: DecorationImage(
                image: AssetImage(
                  appImages.imgBgPutih.path,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${controller.greating.value}${controller.profileController.profile.value.data?.nama ?? ''}',
                        style: TextStyleApp.bodyTextBold.copyWith(
                          color: ColorApp.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'Kelas :  ${controller.profileController.profile.value.data?.kelas ?? ''}',
                        style: TextStyleApp.bodyText.copyWith(
                          fontSize: 14,
                          color: ColorApp.colorPrimary,
                          fontWeight: FontWeight.w800,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CachedNetworkImage(
                    imageUrl: controller
                            .profileController.profile.value.data?.imageUrl ??
                        '',
                    placeholder: (context, url) => Shimmer.fromColors(
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
                    width: 20.w,
                    height: 20.w,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
