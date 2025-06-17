import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.title,
    required this.image,
    this.subtitle,
  });
  final String title;
  final String? subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 30.h,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            title,
            style: TextStyle(
              color: ColorApp.colorPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          Visibility(
            visible: subtitle != null,
            child: Text(
              subtitle ?? '',
              style: TextStyle(
                color: ColorApp.colorPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
