import 'dart:convert';

class ThemeScm {
  final int id;
  final int stageId;
  final String title;
  final String description;
  final List<CourseScm> courses;

  ThemeScm({
    required this.id,
    required this.title,
    required this.stageId,
    required this.description,
    required this.courses,
  });

  factory ThemeScm.fromJson(Map<String, dynamic> json) {
    return ThemeScm(
      id: json['id'],
      stageId: json['stageId'] ?? 0,
      title: json['title'] ?? 'Sin título',
      description: json['description'] ?? 'Sin descripción',
      courses:
          (json['courses'] as List<dynamic>?)
              ?.map((courseJson) => CourseScm.fromJson(courseJson))
              .toList() ??
          [],
    );
  }
}

class CourseScm {
  final int id;
  final int stageId;
  final String title;
  final String description;
  final List<LessonScm> lessons;

  CourseScm({
    required this.id,
    required this.title,
    required this.stageId,
    required this.description,
    required this.lessons,
  });

  factory CourseScm.fromJson(Map<String, dynamic> json) {
    return CourseScm(
      id: json['id'],
      stageId: json['stageId'] ?? 0,
      title: json['title'] ?? 'Sin título',
      description: json['description'] ?? 'Sin descripción',
      lessons:
          (json['lessons'] as List<dynamic>?)
              ?.map((e) => LessonScm.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class LessonScm {
  final int id;
  final int stageId;
  final bool isUnlocked;
  final String title;
  final String description;
  final List<LessonContentScm> lessonContent;

  LessonScm({
    required this.id,
    required this.title,
    required this.stageId,
    required this.description,
    required this.lessonContent,
    required this.isUnlocked,
  });

  factory LessonScm.fromJson(Map<String, dynamic> json) {
    return LessonScm(
      id: json['id'],
      stageId: json['stageId'] ?? 0,
      title: json['title'] ?? 'Sin título',
      description: json['description'] ?? 'Sin descripción',
      lessonContent:
          (json['lessonContents'] as List<dynamic>?)
              ?.map((e) => LessonContentScm.fromJson(e))
              .toList() ??
          [],
      isUnlocked: true,
    );
  }
}

class LessonContentScm {
  final int id;
  final int typeId;
  final int order;
  final int lessonId;
  final Map<String, dynamic> content; // <- Ya como objeto decodificado

  LessonContentScm({
    required this.id,
    required this.typeId,
    required this.order,
    required this.lessonId,
    required this.content,
  });

  factory LessonContentScm.fromJson(Map<String, dynamic> json) {
    final rawContent = json['content'];
    Map<String, dynamic> parsedContent = {};

    if (rawContent is String) {
      try {
        final decoded = jsonDecode(rawContent);
        if (decoded is Map<String, dynamic>) {
          parsedContent = decoded;
        } else {
          // No es un JSON válido, lo almacenamos como texto plano
          parsedContent = {'text': rawContent};
        }
      } catch (e) {
        // No se puede decodificar, almacenamos el string como está
        parsedContent = {'text': rawContent};
      }
    } else if (rawContent is Map<String, dynamic>) {
      parsedContent = rawContent;
    }

    return LessonContentScm(
      id: json['id'],
      typeId: json['typeId'],
      order: json['order'],
      lessonId: json['lessonId'],
      content: parsedContent,
    );
  }
}
