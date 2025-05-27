import 'package:flutter/material.dart';

class AppTheme {

  static const Color primaryDark = Color(0xFF1E1E2F);
  static const Color white = Color(0xFFFFFFFF);



  static const String icon404Path = "assets/404.svg";

   ThemeData theme() {
    return ThemeData(
      // fontFamily: GoogleFonts.lato().fontFamily,
      textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: AppTheme.primaryDark,
          cursorColor: AppTheme.primaryDark),
      // filledButtonTheme: const FilledButtonThemeData(
      //     style: ButtonStyle(
      //         backgroundColor: WidgetStatePropertyAll(highlightMedium))),
      useMaterial3: true,
    );
  }
}
