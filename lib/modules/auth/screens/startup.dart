import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_base_app/auth/login.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/shared/widgets/custom_buttons.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Bienvenido',
            style: TextStyle(fontSize: 10, color: AppTheme.darkBlue),
          ),
          content: Column(
            mainAxisSize:
                MainAxisSize.min, // Esto evita que ocupe toda la pantalla
            children: [
              SizedBox(
                width: 200, // o el valor que prefieras
                child: PrimaryNeonButton(
                  content: 'LOGIN',
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ),
              SizedBox(height: 5),
              const SizedBox(height: 20),
              SizedBox(
                width: 200, // mismo valor
                child: PrimaryNeonButton(
                  content: 'REGISTER',
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/register');
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.teal,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset('assets/mov/optical.gif', fit: BoxFit.cover),
            ),

            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 1.0),
                child: Container(
                  color: Colors.black.withAlpha(
                    80,
                  ), // Puedes ajustar la opacidad o quitarla
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "El contenido estará en inglés de ahora en adelante. ",
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Ícono
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: IconButton(
                  icon: Icon(
                    Icons.power_settings_new_outlined,
                    size: 80,
                    color: AppTheme.white,
                  ),
                  onPressed: () {
                    _showDialog();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
