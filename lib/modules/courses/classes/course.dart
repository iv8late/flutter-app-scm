class ThemeCourse {
  final String title;
  final String status;
  final String content;
  final List<Course> courses;

  ThemeCourse({
    required this.title,
    required this.status,
    required this.content,
    required this.courses,
  });
}

class Course {
  final String title;
  final String subtitle;
  final String content;
  final List<Lesson> lessons;

  Course({
    required this.title,
    required this.subtitle,
    required this.content,
    required this.lessons,
  });
}

class Lesson {
  final String title;
  final String subtitle;
  final String content;
  final List<LessonContent> lessonContent;
  final bool isUnlocked;

  Lesson({
    required this.title,
    required this.subtitle,
    required this.content,
    required this.lessonContent,
    required this.isUnlocked,
  });
}

class LessonContent {
  final int id;
  final int typeId;
  final String title;
  final String subtitle;
  final String content;
  final bool isUnlocked;

  LessonContent({
    required this.id,
    required this.typeId, //TYPE OR CODE,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.isUnlocked,
  });
}
