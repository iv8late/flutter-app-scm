import 'package:flutter/material.dart';
import 'package:project_base_app/lessons/lesson_templates_main.dart';
import 'package:project_base_app/modules/auth/screens/login.dart';
import 'package:project_base_app/modules/auth/screens/register.dart';
import 'package:project_base_app/modules/auth/screens/startup.dart';
import 'package:project_base_app/modules/courses/classes/course.dart';
import 'package:project_base_app/modules/courses/theme_courses_detail.dart';
import 'package:project_base_app/modules/courses/course_lesson_detail.dart';
import 'package:project_base_app/modules/home/screens/home.dart';
import 'package:project_base_app/modules/principal/themes_menu.dart';
import 'package:project_base_app/widgets/notFound/pages/page_404.dart';

class AppRoutes {
  static const initialRoute = '/startup';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/startup': (context) => const StartupScreen(),
    '/login': (context) => const LoginScreen(),
    '/register': (context) => const RegisterScreen(),
    '/lesson':
        (context) => LessonTemplatesMain(
          item: ModalRoute.of(context)!.settings.arguments as LessonScm,
        ),
    '/home': (context) => const HomeScreen(),
    '/themes': (context) => const ThemesMenu(),
    // '/course': (context) => const CoursePreview(),
    '/courseDetail':
        (context) => CourseLessonsDetail(
          item: ModalRoute.of(context)!.settings.arguments as CourseScm,
        ),
    '/themeCourses':
        (context) => ThemeCoursesDetail(
          item: ModalRoute.of(context)!.settings.arguments as ThemeScm,
        ),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const PageNotFound());
  }
}
