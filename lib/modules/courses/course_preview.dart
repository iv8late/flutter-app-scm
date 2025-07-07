import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';

class CoursePreview extends StatelessWidget {
  final Map<String, String> course;

  const CoursePreview({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/course', arguments: course);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: AppTheme.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course['title'] ?? '',
                  style: const TextStyle(
                    color: AppTheme.primaryDark,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  course['subtitle'] ?? '',
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  course['content'] ?? '',
                  style: const TextStyle(fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
