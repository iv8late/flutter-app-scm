class Course {
  final String title;
  final String status;
  final String content;
  final List<SubCourse> subItems;

  Course({
    required this.title,
    required this.status,
    required this.content,
    required this.subItems,
  });
}

class SubCourse {
  final String title;
  final String subtitle;
  final String content;

  SubCourse({
    required this.title,
    required this.subtitle,
    required this.content,
  });
}

final courses = [
  Course(
    title: 'THEME 1',
    status: 'completed',
    content: 'Learn about common error vocabulary',
    subItems: [
      SubCourse(title: 'Course 1', subtitle: 'Sub 1', content: 'Details'),
      SubCourse(title: 'Course 2', subtitle: 'Sub 2', content: 'Details 2'),
    ],
  ),
  Course(
    title: 'THEME 2',
    status: 'Courses: 0',
    content: 'Learn about vocabulary',
    subItems: [],
  ),
];
