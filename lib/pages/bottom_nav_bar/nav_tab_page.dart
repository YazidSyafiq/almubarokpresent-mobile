import 'package:almubarok_present/pages/bottom_nav_bar/widgets/fab_bottom_app_bar.dart';
import 'package:almubarok_present/pages/history/history_page.dart';
import 'package:almubarok_present/pages/home/home_page.dart';
import 'package:almubarok_present/pages/leave/leave_page.dart';
import 'package:almubarok_present/pages/profile/profile_page.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/routes/page_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'nav_tab_controller.dart';
import 'package:sizer/sizer.dart';

class NavTabPage extends StatelessWidget {
  const NavTabPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavTabController>(
      builder: (controller) {
        return Obx(
          () {
            debugPrint('Current Tab Index: ${controller.tabIndex.value}');
            return Scaffold(
              body: IndexedStack(
                index: controller.tabIndex.value, // Current tab index
                children: [
                  HomePage(),
                  HistoryPage(),
                  LeavePage(),
                  ProfilePage(),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: _buildFab(context, controller),
              bottomNavigationBar: FABBottomAppBar(
                height: 10.h,
                centerItemText: '',
                // backgroundColor: const Color.fromARGB(255, 251, 8, 8),
                backgroundColor: ColorApp.white,
                color: Colors.grey,
                selectedColor: ColorApp.colorPrimary,
                notchedShape: const CircularNotchedRectangle(),
                currentIndex: controller.tabIndex.value,
                onTabSelected: (index) {
                  controller.changeTabIndex(index);
                },
                iconSize: 30,
                items: [
                  FABBottomAppBarItem(iconData: Icons.house, text: 'Home'),
                  FABBottomAppBarItem(iconData: Icons.history, text: 'History'),
                  FABBottomAppBarItem(
                      iconData: Icons.edit_calendar, text: 'Leave'),
                  FABBottomAppBarItem(iconData: Icons.person, text: 'Profile'),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFab(BuildContext context, NavTabController controller) {
    return Transform.translate(
      offset:
          const Offset(0, 18), // Atur offset Y untuk memindahkan FAB ke bawah
      child: PhysicalModel(
        color: Colors.transparent, // Background FAB transparan
        shape: BoxShape.rectangle, // Bentuk FAB
        elevation: 20.0, // Efek bayangan
        shadowColor: Colors.black.withOpacity(0.3), // Warna bayangan
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), // Sesuaikan radius kotak
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Warna bayangan
                blurRadius: 5.0, // Blur efek bayangan
                spreadRadius: 1.0, // Menyebar bayangan
                offset: const Offset(0, 4), // Posisi bayangan
              ),
            ],
          ),
          child: FloatingActionButton(
            onPressed: () {
              Get.toNamed(PageName.attendance);
            },
            tooltip: '',
            elevation: 0.0, // Matikan bayangan bawaan FAB
            backgroundColor: ColorApp.colorPrimary, // Warna FAB
            child: Icon(
              Icons.fingerprint,
              color: ColorApp.white,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
