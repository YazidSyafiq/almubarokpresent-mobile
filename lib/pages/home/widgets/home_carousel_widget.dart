import 'package:almubarok_present/controllers/home_controller.dart';
import 'package:almubarok_present/pages/home/widgets/home_container_widget.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeCarouselWidget extends StatelessWidget {
  const HomeCarouselWidget({
    super.key,
    required this.controller,
  });
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: controller.carouselController,
          items: [
            HomeContainerWidget(
              image: appImages.imgLogoPutih.path,
              title: 'Al Mubarok Present',
              subtitle:
                  'Solusi modern untuk memudahkan aktivitas belajar mengaji Anda!',
            ),
            HomeContainerWidget(
              image: appImages.illFaceRecognitionMuslim.path,
              title: 'Presensi Modern',
              subtitle:
                  'Teknologi face recognition menjadikan proses absensi lebih cepat dan akurat',
            ),
            HomeContainerWidget(
              image: appImages.illHistoryLeave.path,
              title: 'Kelola Kehadiran dengan Mudah',
              subtitle:
                  'Ajukan izin dan pantau riwayat presensi kapan saja langsung dari aplikasi.',
            ),
          ],
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              controller.activeIndex.value = index;
            },
            height: 164,
            autoPlay: true,
            viewportFraction: 1,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Obx(
          () => AnimatedSmoothIndicator(
            activeIndex: controller.activeIndex.value,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              dotColor: ColorApp.grey,
              activeDotColor: ColorApp.colorPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
