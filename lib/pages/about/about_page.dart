import 'package:almubarok_present/controllers/about_controller.dart';
import 'package:almubarok_present/pages/about/widgets/bullet_point_widget.dart';
import 'package:almubarok_present/pages/about/widgets/expansion_tile_widget.dart';
import 'package:almubarok_present/resources/resources.dart';
import 'package:almubarok_present/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorApp.white,
          appBar: AppBarWidget(
            title: 'About',
            leadingIcon: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                ExpansionTileWidget(
                  icon: Icons.settings,
                  title: 'Versi Aplikasi',
                  widget: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 12,
                    ),
                    child: Obx(
                      () => Text(
                        'v${controller.version.value}',
                        style: TextStyleApp.bodyText,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                ExpansionTileWidget(
                  icon: Icons.info_outline,
                  title: 'Tentang Aplikasi',
                  widget: Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 12,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Al Mubarok Present adalah aplikasi presensi digital yang dirancang khusus untuk siswa Lembaga Kursus Mengaji Al Mubarok Pamulang. Aplikasi ini menggunakan teknologi modern untuk memudahkan proses absensi, sehingga menjadi lebih efisien, akurat, dan aman.",
                          style: TextStyleApp.bodyText.copyWith(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Fitur Utama:",
                          style: TextStyleApp.bodyTextBold.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        BulletPointWidget(
                            text: "Presensi Digital dengan Face Recognition"),
                        BulletPointWidget(
                            text:
                                "Menggunakan teknologi pengenalan wajah untuk memastikan kehadiran siswa secara akurat dan aman, sehingga meminimalkan risiko kecurangan dalam proses absensi."),
                        BulletPointWidget(text: "Pengajuan Izin Secara Online"),
                        BulletPointWidget(
                            text:
                                "Memudahkan siswa untuk mengajukan izin ketidakhadiran langsung melalui aplikasi, lengkap dengan alasan dan bukti pendukung jika diperlukan."),
                        BulletPointWidget(
                            text: "Riwayat Kehadiran (History Presensi)"),
                        BulletPointWidget(
                            text:
                                "Siswa dapat melihat riwayat kehadiran mereka secara real-time, sehingga memudahkan dalam memantau kehadiran dan izin yang telah diajukan."),
                        SizedBox(height: 16),
                        Text(
                          "Manfaat Aplikasi:",
                          style: TextStyleApp.bodyTextBold.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        BulletPointWidget(
                            text:
                                "Presensi Lebih Akurat dan Aman: \nMenggunakan face recognition untuk memastikan kehadiran yang valid."),
                        BulletPointWidget(
                            text:
                                "Pengelolaan Izin yang Mudah: \nProses pengajuan izin lebih cepat dan terdokumentasi dengan baik."),
                        BulletPointWidget(
                            text:
                                "Pemantauan Kehadiran yang Transparan: \nSiswa dapat mengakses riwayat kehadiran mereka kapan saja, memberikan transparansi dan keterbukaan."),
                        SizedBox(height: 16),
                        Text(
                          "Aplikasi Al Mubarok Present adalah langkah inovatif dalam mendukung proses administrasi kehadiran di Al Mubarok Pamulang, menciptakan lingkungan belajar yang lebih modern, efektif, dan terorganisir.",
                          style: TextStyleApp.bodyText.copyWith(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
