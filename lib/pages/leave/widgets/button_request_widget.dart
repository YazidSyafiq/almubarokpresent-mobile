import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ButtonRequestWidget extends StatelessWidget {
  const ButtonRequestWidget({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 55,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.post_add_rounded,
              color: ColorApp.white,
              size: 30,
            ),
            SizedBox(
              width: 1.5.w,
            ),
            Text(
              'Request',
              style: TextStyleApp.bodyTextBold.copyWith(
                color: ColorApp.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
