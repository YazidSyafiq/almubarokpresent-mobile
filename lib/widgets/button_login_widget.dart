import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';

class ButtonLoginWidget extends StatelessWidget {
  const ButtonLoginWidget({
    super.key,
    this.width,
    required this.enable,
    required this.titleButton,
    required this.onTap,
  });

  final double? width;
  final bool enable;
  final String titleButton;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enable ? onTap : null,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: enable ? ColorApp.colorPrimary : ColorApp.grey,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            ElevationApp.elevation4pxBottom,
          ],
          image: enable
              ? DecorationImage(
                  image: AssetImage(
                    appImages.imgBgProfile.path,
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.3,
                )
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              titleButton,
              style: TextStyleApp.bodyTextBold.copyWith(
                color: ColorApp.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
