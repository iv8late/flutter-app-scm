import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_base_app/config/env/environment.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/shared/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  String environment = const String.fromEnvironment('ENVIRONMENT', defaultValue: Environment.dev);
  Environment().initConfig(environment);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     final appName = Environment().config!.appName;
    return MaterialApp(
      title: appName,
      theme: AppTheme().theme(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      
    );
  }
}
