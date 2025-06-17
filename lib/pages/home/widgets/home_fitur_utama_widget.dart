import 'package:almubarok_present/controllers/home_controller.dart';
import 'package:almubarok_present/pages/home/widgets/home_fitur_utama_item.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/routes/page_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeFiturUtamaWidget extends StatelessWidget {
  const HomeFiturUtamaWidget({
    super.key,
    required this.controller,
  });
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: BorderRadius.circular(20),
        border: Border(
          right: BorderSide(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fitur Utama',
            style: TextStyleApp.bodyTextBold.copyWith(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HomeFiturUtamaItem(
                title: 'Attendance',
                icon: Icons.fingerprint,
                onTap: () {
                  Get.offAllNamed(PageName.attendance);
                },
              ),
              HomeFiturUtamaItem(
                onTap: () {
                  controller.navTabController.changeTabIndex(1);
                  Get.toNamed(PageName.navTab);
                },
                title: 'History',
                icon: Icons.history,
              ),
              HomeFiturUtamaItem(
                onTap: () {
                  controller.navTabController.changeTabIndex(2);
                  Get.toNamed(PageName.navTab);
                },
                title: 'Leave',
                icon: Icons.edit_calendar_rounded,
              )
            ],
          ),
        ],
      ),
    );
  }
}
