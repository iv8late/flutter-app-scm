import 'package:flutter/material.dart';
import 'package:project_base_app/lessons/lesson_content.dart';
import 'package:project_base_app/modules/auth/screens/login.dart';
import 'package:project_base_app/modules/auth/screens/register.dart';
import 'package:project_base_app/modules/auth/screens/startup.dart';
import 'package:project_base_app/modules/home/screens/home.dart';
import 'package:project_base_app/modules/principal/menu_courses.dart';
import 'package:project_base_app/widgets/notFound/pages/page_404.dart';

class AppRoutes {
  static const initialRoute = '/startup';

  static Map<String, Widget Function(BuildContext)> routes = {
    // '/settings': (context) => const SettingsScreen(),
    '/startup': (context) => const StartupScreen(),
    '/login': (context) => const LoginScreen(),
    '/register': (context) => const RegisterScreen(),
    '/lesson': (context) => const LessonContent(),
    '/home': (context) => const HomeScreen(),
    '/courses': (context) => const MenuCourses(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const PageNotFound());
  }
}
