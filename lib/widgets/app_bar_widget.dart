import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    required this.leadingIcon,
  });
  final String title;
  final bool leadingIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyleApp.titleText.copyWith(
          fontSize: 20,
          color: ColorApp.colorPrimary,
        ),
      ),
      leading: Visibility(
        visible: leadingIcon,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorApp.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      centerTitle: true,
      backgroundColor: ColorApp.white,
      surfaceTintColor: ColorApp.white,
    );
  }

  // Menentukan ukuran preferensi AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
