import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/utils/date_format_converter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemListLeaveWidget extends StatelessWidget {
  const ItemListLeaveWidget({
    super.key,
    required this.date,
    required this.status,
    required this.onTap,
  });
  final DateTime? date;
  final String? status;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
        bottom: 2.h,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorApp.grey.withOpacity(0.2),
            ),
            color: ColorApp.white,
            boxShadow: [ElevationApp.elevation4pxBottom],
            borderRadius: BorderRadius.circular(20),
          ),
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
                        opacity: 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.edit_calendar,
                        color: ColorApp.white,
                        size: 32,
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
                        'Izin',
                        style: TextStyleApp.bodyTextBold.copyWith(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.w,
                      ),
                      Text(
                        DateFormatConverter.convertDateFormat(
                          date,
                        ),
                        style: TextStyleApp.bodyText.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: status == 'Approved'
                      ? ColorApp.green
                      : status == 'Pending'
                          ? ColorApp.grey
                          : ColorApp.red,
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
      ),
    );
  }
}
