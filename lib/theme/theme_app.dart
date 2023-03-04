import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:read_qr/theme/colors.dart';

class ThemeApp{
  static final ThemeData configTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: kBrandBlack,
    useMaterial3: true,
    textTheme: GoogleFonts.montserratTextTheme(),
  );
}