import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RegisterFaceDialog extends StatelessWidget {
  const RegisterFaceDialog({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: ColorApp.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Image.asset(
                appImages.icFace.path,
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Klik tombol di bawah untuk mengonfirmasi pendaftaran wajah Anda!',
                style: TextStyleApp.bodyTextSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 3.h,
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
                      'Konfirmasi',
                      style: TextStyleApp.bodyTextBold.copyWith(
                        color: ColorApp.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
