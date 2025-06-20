import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';

class AlertBanned extends StatelessWidget {
  const AlertBanned({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorApp.red.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Anda tidak dapat melakukan presensi!. Hubungi Admin untuk dibukakan akses presensi dan pastikan Anda tidak menggunakan Fake GPS',
        style: TextStyleApp.bodyTextSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
