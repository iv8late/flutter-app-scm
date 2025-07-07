import 'package:flutter/material.dart';
import 'package:project_base_app/lessons/lesson_content.dart';
import 'package:project_base_app/modules/auth/screens/login.dart';
import 'package:project_base_app/modules/auth/screens/register.dart';
import 'package:project_base_app/modules/auth/screens/startup.dart';
import 'package:project_base_app/modules/courses/classes/subitem_class.dart';
import 'package:project_base_app/modules/courses/course.dart';
import 'package:project_base_app/modules/courses/course_detail_page.dart';
import 'package:project_base_app/modules/courses/course_menu.dart';
import 'package:project_base_app/modules/home/screens/home.dart';
import 'package:project_base_app/modules/principal/themes_menu.dart';
import 'package:project_base_app/widgets/notFound/pages/page_404.dart';

class AppRoutes {
  static const initialRoute = '/startup';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/startup': (context) => const StartupScreen(),
    '/login': (context) => const LoginScreen(),
    '/register': (context) => const RegisterScreen(),
    '/lesson': (context) => const LessonContent(),
    '/home': (context) => const HomeScreen(),
    '/themes': (context) => const ThemesMenu(),
    // '/course': (context) => const CoursePreview(),
    '/courseMenu':
        (context) => CourseMenu(item: _sampleCourse), // Ruta para el menú
    '/courseDetail':
        (context) => CourseDetailPage(
          item: _sampleCourse,
        ), // Ruta para los detalles del curso
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const PageNotFound());
  }

  static final Course _sampleCourse = Course(
    title: 'Curso de Flutter',
    status: 'Activo',
    content: 'Aprende Flutter desde cero.',
    subItems: [
      SubCourse(
        title: 'Lección 1: Introducción a Flutter',
        content: 'Configura tu entorno de desarrollo.',
        subtitle: 'subtitle',
      ),
      SubCourse(
        title: 'Lección 2: Widgets en Flutter',
        content: 'Aprende sobre los widgets básicos.',
        subtitle: 'subtitle',
      ),
      SubCourse(
        title: 'Lección 3: Estado en Flutter',
        content: 'Gestiona el estado en Flutter.',
        subtitle: 'subtitle',
      ),
    ],
  );
}

  // Ejemplo de curso
 