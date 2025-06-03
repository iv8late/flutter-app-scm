import 'package:flutter/material.dart';

class AppTheme {
  static const Color white = Color(0xFFFFFFFF);
  static const Color primaryDark = Color(0xFF101C29);
  static const Color darkBlue = Color(0xFF0A1C3D);
  static const Color blue = Color(0xFF2868C6);
  static const Color teal = Color(0xFF91D2F4);
  static const Color pink = Color(0xFFCBA2EA);
  static const Color purple = Color(0xFF3F3381);
  static const Color darkPurple = Color(0xFF1D1F5A);

  static const String icon404Path = "assets/404.svg";

  ThemeData theme() {
    return ThemeData(
      // fontFamily: GoogleFonts.lato().fontFamily,
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
