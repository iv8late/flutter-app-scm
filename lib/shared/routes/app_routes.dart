import 'package:flutter/material.dart';
import 'package:project_base_app/auth/login.dart';
import 'package:project_base_app/modules/404/pages/page_404.dart';

class AppRoutes {
  static const initialRoute = '/login';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/login': (context) => const LoginScreen(),
    // '/settings': (context) => const SettingsScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const PageNotFound());
  }
}
