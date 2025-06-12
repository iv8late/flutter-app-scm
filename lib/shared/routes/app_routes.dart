import 'package:flutter/material.dart';
import 'package:project_base_app/auth/login.dart';
import 'package:project_base_app/lessons/lesson_content.dart';
import 'package:project_base_app/modules/auth/screens/startup.dart';
import 'package:project_base_app/widgets/notFound/pages/page_404.dart';

class AppRoutes {
  static const initialRoute = '/startup';

  static Map<String, Widget Function(BuildContext)> routes = {
    // '/settings': (context) => const SettingsScreen(),
    '/startup': (context) => const StartupScreen(),
    '/login': (context) => const LoginScreen(),
    '/lesson': (context) => const LessonContent(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const PageNotFound());
  }
}
