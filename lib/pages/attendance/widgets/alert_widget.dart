import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({super.key});

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
        'Anda tidak dapat melakukan presensi!. Pastikan Anda berada di lokasi pembelajaran untuk melakukan presensi!',
        style: TextStyleApp.bodyTextSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
