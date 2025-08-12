import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/shared/json_classes/lesson_json_content.dart';

Widget buildCards(LessonContentData data, bool isSpanish) {
  final tableSections = data.tables ?? [];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (var section in tableSections) ...[
        // Título de la sección
        if (section.title != null)
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 6),
            child: Text(
              isSpanish ? section.title!.es : section.title!.en,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.white,
              ),
            ),
          ),

        // Filas de la tabla
        if (section.tableContent != null)
          ...section.tableContent!.map(
            (row) => Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.label_important,
                          color: AppTheme.darkBlue,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          isSpanish ? row.element.es : row.element.en,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.darkBlue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text("📝 ", style: TextStyle(fontSize: 18)),
                        Expanded(
                          child: Text(
                            isSpanish ? row.description.es : row.description.en,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            isSpanish ? row.example.es : row.example.en,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    ],
  );
}
