import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';

class AlertLeave extends StatelessWidget {
  const AlertLeave({super.key});

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
        'Izin Anda hari ini diterima, saat ini anda tidak dapat melakukan presensi!',
        style: TextStyleApp.bodyTextSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
