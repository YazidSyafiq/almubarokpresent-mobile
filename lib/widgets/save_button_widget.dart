import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
    required this.onTap,
    this.isRequest,
  });
  final void Function() onTap;
  final bool? isRequest;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
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
          boxShadow: [
            ElevationApp.elevation4pxBottom,
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: isRequest == true ? false : true,
              child: Icon(
                Icons.save_rounded,
                color: ColorApp.white,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(
              isRequest == true ? 'Submit' : 'Save',
              style: TextStyleApp.titleText.copyWith(
                fontSize: 16,
                color: ColorApp.white,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Visibility(
              visible: isRequest == false ? false : true,
              child: Icon(
                Icons.send,
                color: ColorApp.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
