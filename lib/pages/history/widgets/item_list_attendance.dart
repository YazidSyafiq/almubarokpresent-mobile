import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/utils/date_format_converter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemListAttendance extends StatelessWidget {
  const ItemListAttendance({
    super.key,
    required this.day,
    required this.date,
    required this.checkInTime,
    required this.checkOutTime,
    required this.status,
  });
  final DateTime? day;
  final DateTime? date;
  final String? checkInTime;
  final String? checkOutTime;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 2.h, left: 8, right: 8),
      decoration: BoxDecoration(
        color: ColorApp.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [ElevationApp.elevation4pxBottom],
        border: Border.all(
          color: ColorApp.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
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
                  ),
                  child: Center(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: ColorApp.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.history,
                        color: ColorApp.colorPrimary,
                        size: 32,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormatConverter.convertDayFormat(day),
                      style: TextStyleApp.bodyTextBold.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 0.5.w,
                    ),
                    Text(
                      DateFormatConverter.convertDateFormat(date),
                      style: TextStyleApp.bodyText.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                    Row(
                      children: [
                        Text(
                          "Masuk   :  ",
                          style: TextStyleApp.bodyTextBold.copyWith(
                            fontSize: 12,
                            color: ColorApp.green,
                          ),
                        ),
                        Text(
                          DateFormatConverter.convertTimeFormat(checkInTime),
                          style: TextStyleApp.bodyText.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0.5.w,
                    ),
                    Row(
                      children: [
                        Text(
                          "Pulang  :  ",
                          style: TextStyleApp.bodyTextBold
                              .copyWith(fontSize: 12, color: ColorApp.red),
                        ),
                        Text(
                          DateFormatConverter.convertTimeFormat(checkOutTime),
                          style: TextStyleApp.bodyText.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: status == 'Tepat Waktu' ? ColorApp.green : ColorApp.red,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                child: Text(
                  status ?? '-',
                  style: TextStyleApp.bodyTextBold.copyWith(
                    fontSize: 9,
                    color: ColorApp.white,
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
