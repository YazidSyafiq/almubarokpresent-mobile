import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeContainerWidget extends StatelessWidget {
  const HomeContainerWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24,
      ),
      width: double.infinity,
      height: 140,
      padding: EdgeInsets.only(
        top: 12,
        left: 24,
        right: 4,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: ColorApp.colorPrimary,
        image: DecorationImage(
          image: AssetImage(
            appImages.imgBgProfile.path,
          ),
          opacity: 0.25,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyleApp.titleText.copyWith(
                    color: ColorApp.white,
                    fontSize: 17,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyleApp.bodyText.copyWith(
                    color: ColorApp.white,
                    fontSize: 12,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Image.asset(
            image,
            width: 40.w,
          ),
        ],
      ),
    );
  }
}
