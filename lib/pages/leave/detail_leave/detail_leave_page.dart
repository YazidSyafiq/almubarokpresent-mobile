import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DetailLeavePage extends StatelessWidget {
  const DetailLeavePage(
      {super.key,
      required this.day,
      required this.date,
      required this.status,
      required this.reason,
      required this.note});
  final String day;
  final String date;
  final String status;
  final String reason;
  final String note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBarWidget(
        title: 'Detail Leave',
        leadingIcon: true,
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorApp.grey.withOpacity(0.2),
          ),
          color: ColorApp.white,
          boxShadow: [ElevationApp.elevation4pxBottom],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              day,
              style: TextStyleApp.bodyTextBold.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              date,
              style: TextStyleApp.bodyText.copyWith(
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Table(
              columnWidths: {
                0: FixedColumnWidth(30.w), // Kolom pertama lebar 200
                1: FlexColumnWidth(), // Kolom kedua akan mengisi sisa ruang
              },
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Status',
                        style: TextStyleApp.bodyTextBold.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(':    '),
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
                                status,
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
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Alasan',
                        style: TextStyleApp.bodyTextBold.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(':    '),
                          Expanded(
                            child: Text(
                              reason,
                              style: TextStyleApp.bodyText.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Catatan',
                        style: TextStyleApp.bodyTextBold.copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(':    '),
                          Expanded(
                            child: Text(
                              note,
                              style: TextStyleApp.bodyText.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
