import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/courses/classes/course.dart';

class InputLesson extends StatelessWidget {
  final LessonScm lesson;
  final LessonContentScm content;

  const InputLesson({super.key, required this.lesson, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(color: AppTheme.purple);
  }
}
