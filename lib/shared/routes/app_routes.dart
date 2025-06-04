import 'package:flutter/material.dart';
import 'package:project_base_app/auth/login.dart';
import 'package:project_base_app/lessons/lesson_content.dart';
import 'package:project_base_app/modules/404/pages/page_404.dart';

class AppRoutes {
  static const initialRoute = '/login';

  static Map<String, Widget Function(BuildContext)> routes = {
    // '/settings': (context) => const SettingsScreen(),
    '/login': (context) => const LoginScreen(),
    '/lesson': (context) => const LessonContent(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const PageNotFound());
  }
}
