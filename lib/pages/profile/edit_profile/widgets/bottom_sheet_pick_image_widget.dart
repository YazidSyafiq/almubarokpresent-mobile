import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';

class BottomSheetPickImageWidget extends StatelessWidget {
  const BottomSheetPickImageWidget({
    super.key,
    required this.cameraPick,
    required this.galleryPick,
  });

  final void Function()? cameraPick;
  final void Function()? galleryPick;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: cameraPick,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 13,
                right: 30,
                bottom: 17,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ambil Foto",
                    style: TextStyleApp.bodyText.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  Icon(
                    Icons.camera_alt_outlined,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Divider(
              height: 2,
            ),
          ),
          InkWell(
            onTap: galleryPick,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 13, bottom: 13, left: 16, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pilih Foto",
                    style: TextStyleApp.bodyText.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  Icon(
                    Icons.photo_outlined,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
