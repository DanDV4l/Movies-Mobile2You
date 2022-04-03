import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/shared/themes/appcolors.dart';

class Styles {
  static final title = GoogleFonts.oxygen(
      color: AppColors.text, fontSize: 24, fontWeight: FontWeight.bold);
  static final listTitle = GoogleFonts.oxygen(
    color: AppColors.textTitle,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
  static final subtitle = GoogleFonts.oxygen(
    color: AppColors.textSubtitle,
    fontSize: 14,
  );
  static final subtitleBold = GoogleFonts.oxygen(
    color: AppColors.textSubtitle,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  static final homeTitle = GoogleFonts.mukta(fontSize: 24, color: Colors.white);

  static const buttons = TextStyle(
      color: AppColors.buttons, fontSize: 19, fontWeight: FontWeight.bold);
}
