import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeFiturUtamaItem extends StatelessWidget {
  const HomeFiturUtamaItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: 100.w / 5.5,
            height: 100.w / 5.5,
            decoration: BoxDecoration(
              color: ColorApp.colorPrimary,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(
                  appImages.imgBgProfile.path,
                ),
                opacity: 0.3,
                fit: BoxFit.cover,
              ),
              boxShadow: [
                ElevationApp.elevation4pxBottom,
              ],
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              size: 100.w / 10,
              color: ColorApp.white,
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          title,
          style: TextStyleApp.bodyText.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
