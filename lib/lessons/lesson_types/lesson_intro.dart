import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/courses/classes/course.dart';
import 'package:project_base_app/services/theme_services.dart';
import 'package:project_base_app/shared/generic_response.dart';

class IntroLesson extends StatelessWidget {
  final LessonScm lesson;
  final LessonContentScm content;

  const IntroLesson({super.key, required this.lesson, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.blue,
      padding: const EdgeInsets.all(16), // Ajusta el espaciado según necesidad
      child: SingleChildScrollView(
        child: Text(
          "",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.white,
            shadows: [
              Shadow(
                color: AppTheme.primaryDark,
                offset: Offset(2, 2),
                blurRadius: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
