import 'package:almubarok_present/resources/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const appImages = Assets.images;

class ColorApp {
  static Color colorPrimary = const Color(0xFFD4AF37);
  static Color black = const Color(0xFF000000);
  static Color white = const Color(0xFFFFFFFF);
  static Color grey = const Color(0xFF9E9E9E);
  static Color red = const Color(0xFFFF0000);
  static Color green = const Color(0xFF55A630);
}

class ElevationApp {
  static BoxShadow elevation4pxBottom = BoxShadow(
    color: ColorApp.black.withOpacity(0.25),
    spreadRadius: 0,
    blurRadius: 4,
    offset: const Offset(0, 4),
  );
}

class TextStyleApp {
  static TextStyle titleText = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bodyText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static TextStyle bodyTextBold = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bodyTextSmall = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
}
