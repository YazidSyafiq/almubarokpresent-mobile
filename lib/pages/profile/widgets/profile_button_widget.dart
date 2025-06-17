import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileButtonWidget extends StatelessWidget {
  const ProfileButtonWidget({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
  });

  final void Function() onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: ColorApp.colorPrimary,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(
              appImages.imgBgProfile.path,
            ),
            fit: BoxFit.cover,
            opacity: 0.3,
          ),
          boxShadow: [ElevationApp.elevation4pxBottom],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 30,
                color: ColorApp.white,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                title,
                style: TextStyleApp.bodyTextBold.copyWith(
                  fontSize: 18,
                  color: ColorApp.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
