import 'package:almubarok_present/resources/resources.dart';
import 'package:flutter/material.dart';

class BulletPointWidget extends StatelessWidget {
  const BulletPointWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("• ", style: TextStyle(fontSize: 16)),
        Expanded(
          child: Text(
            text,
            style: TextStyleApp.bodyText.copyWith(
              fontSize: 14,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
