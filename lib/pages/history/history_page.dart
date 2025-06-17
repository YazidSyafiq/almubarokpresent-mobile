import 'package:almubarok_present/controllers/history_controller.dart';
import 'package:almubarok_present/pages/history/history_month/list_history_month.dart';
import 'package:almubarok_present/pages/history/history_year/month_list.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/routes/page_names.dart';
import 'package:almubarok_present/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      builder: (controller) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          controller.getAttendanceMonth();
        });
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (!didPop) {
              controller.navTabController.changeTabIndex(0);
              Get.toNamed(PageName.navTab);
            }
          },
          child: Scaffold(
            backgroundColor: ColorApp.white,
            appBar: AppBarWidget(
              title: 'History',
              leadingIcon: false,
            ),
            body: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 60,
                    margin: const EdgeInsets.only(
                      top: 0,
                      left: 16,
                      right: 16,
                      bottom: 5,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorApp.grey.withOpacity(
                          0.2,
                        ),
                      ),
                      color: ColorApp.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        ElevationApp.elevation4pxBottom,
                      ],
                    ),
                    child: TabBar(
                      labelPadding: EdgeInsets.zero,
                      dividerColor: Colors.transparent,
                      indicatorWeight: 0,
                      dividerHeight: 0,
                      labelColor: ColorApp.white,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: const EdgeInsets.all(5),
                      unselectedLabelColor: ColorApp.colorPrimary,
                      labelStyle: TextStyleApp.bodyTextBold.copyWith(
                        fontSize: 14,
                      ),
                      indicator: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            appImages.imgBgProfile.path,
                          ),
                          fit: BoxFit.cover,
                          opacity: 0.3,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: ColorApp.colorPrimary,
                      ),
                      tabs: [
                        Tab(text: 'This Month'),
                        Tab(text: 'This Year'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TabBarView(
                        children: [
                          ListHistoryMonth(),
                          MonthList(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
