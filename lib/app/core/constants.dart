import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  const AppConstants._();

  static final colors = _Colors();
  static final texts = _Texts();
}

class _Colors {
  final primary = const Color(0xfffbbf24);
  final white = const Color(0xffffffff);
  final black = const Color(0xff282828);
  final grey = const Color(0xff7E7E7E);
  final red = const Color(0xffEF4444);
}

class _Texts {
  final headline = GoogleFonts.dmSans(fontSize: 48, fontWeight: FontWeight.bold, color: AppConstants.colors.black);
  final paragraph = GoogleFonts.dmSans(fontSize: 16, fontWeight: FontWeight.w400, color: AppConstants.colors.grey);
  final button = GoogleFonts.dmSans(fontSize: 20, fontWeight: FontWeight.bold, color: AppConstants.colors.grey);
}
