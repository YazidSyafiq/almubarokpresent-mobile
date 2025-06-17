import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.widget,
  });
  final IconData icon;
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [ElevationApp.elevation4pxBottom],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: ExpansionTile(
          title: SizedBox(
            height: 45,
            child: Row(
              children: [
                Icon(
                  icon,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  title,
                  style: TextStyleApp.bodyTextBold,
                ),
              ],
            ),
          ),
          children: [
            widget,
          ],
        ),
      ),
    );
  }
}
