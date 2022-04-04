import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static Text regular(
    String text, {
    double? fontSize,
    Color? color,
    TextAlign? align,
    FontWeight? weight,
  }) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
