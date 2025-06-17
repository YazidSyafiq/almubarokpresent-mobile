import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            appImages.animationNotFoundLottie,
            width: 30.w,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            'Data Not Found',
            style: TextStyleApp.bodyTextBold,
          ),
        ],
      ),
    );
  }
}
