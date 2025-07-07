import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );

  static const TextStyle body = TextStyle(fontSize: 16, color: Colors.white70);

  static const TextStyle italicPinkBody = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppTheme.lightestPurple,
    fontStyle: FontStyle.italic,
    letterSpacing: 1.8,
  );
  static const TextStyle pinkBodyBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppTheme.lightestPurple,
    letterSpacing: 1.8,
  );
  static const TextStyle pinkTitleBold = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    color: AppTheme.lightestPurple,
  );

  static final TextStyle bodyMovingText = GoogleFonts.lato(
    color: AppTheme.white,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
    shadows: [
      Shadow(color: Colors.white, blurRadius: 50, offset: Offset(1, 0)),
      Shadow(color: Colors.white, blurRadius: 8, offset: Offset(0, 1)),
    ],
  );

  static const TextStyle caption = TextStyle(fontSize: 12, color: Colors.grey);
}
