import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soc_grocery/app/config/app_colors.dart';

mixin AppTextStyles {

  static TextStyle montserrat({
    double? fontSize,
    FontWeight? fonWeight,
    Color? color
  }){
    return GoogleFonts.beVietnamPro(
      textStyle: TextStyle(
        fontSize: fontSize ?? 13,
        fontWeight: fonWeight ?? FontWeight.w600,
        color: color ?? AppColors.black
      ),
    );
  }
}