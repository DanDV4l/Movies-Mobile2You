import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile2you/shared/themes/appcolors.dart';

class Styles {
  static final title = GoogleFonts.inter(
      color: AppColors.text, fontSize: 26, fontWeight: FontWeight.bold);
  static final subtitle = GoogleFonts.inter(
    color: AppColors.text,
    fontSize: 14,
  );
  static const buttons = TextStyle(
      color: AppColors.buttons, fontSize: 19, fontWeight: FontWeight.bold);
}
