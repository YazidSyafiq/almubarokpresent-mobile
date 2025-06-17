import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RegisterFaceWidget extends StatelessWidget {
  const RegisterFaceWidget({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              appImages.icFace.path,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Anda tidak dapat melakukan presensi karena Anda belum mendaftarkan wajah Anda!',
              style: TextStyleApp.bodyTextSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 2.h,
            ),
            InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: double.infinity,
                height: 50,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ColorApp.colorPrimary,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(
                      appImages.imgBgProfile.path,
                    ),
                    opacity: 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Daftarkan Wajah',
                    style: TextStyleApp.bodyTextBold.copyWith(
                      color: ColorApp.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
