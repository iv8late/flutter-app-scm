import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color white = Color(0xFFEEEEF0);
  static const Color primaryDark = Color(0xFF101C29);
  static const Color darkBlue = Color(0xFF282B4D);
  static const Color blue = Color(0xFF5672EF);
  static const Color lightblue = Color(0xFF668DF3);
  static const Color teal = Color(0xFF89CDF8);
  static const Color darkTeal = Color.fromARGB(255, 43, 181, 255);
  static const Color pink = Color(0xFFCBA2EA);
  static const Color darkPink = Color.fromARGB(255, 154, 122, 178);
  static const Color lightestPurple = Color(0XffB3AAE6);
  static const Color purple = Color(0xFF857AE6);
  static const Color darkPurple = Color(0xFF766BD6);
  static const Color darkestPurple = Color(0xFF1D1F5A);

  static const String icon404Path = "assets/404.svg";

  ThemeData theme() {
    return ThemeData(
      fontFamily: GoogleFonts.tektur().fontFamily,
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: AppTheme.blue,
        cursorColor: AppTheme.purple,
      ),
      // filledButtonTheme: const FilledButtonThemeData(
      //     style: ButtonStyle(
      //         backgroundColor: WidgetStatePropertyAll(highlightMedium))),
      useMaterial3: true,
    );
  }
}
