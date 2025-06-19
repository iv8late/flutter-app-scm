import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/shared/widgets/custom_buttons.dart';
import 'package:project_base_app/shared/widgets/custom_textStyles.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  void _showDialog() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dialog",
      pageBuilder: (context, animation, secondaryAnimation) {
        return Stack(
          children: [
            Positioned(
              top: 450,
              left: 20,
              right: 20,
              child: Material(
                color: Colors.transparent,
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.transparent,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // title: Text(
                      //   'Bienvenido',
                      //   style: TextStyle(
                      //     color: Colors.greenAccent,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                      SizedBox(
                        width: 200,
                        child: PrimaryNeonButton(
                          content: 'LOGIN',
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 200,
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
                ),
              ),
            ),
          ],
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
              child: Image.asset(
                'assets/bg/lo-fi_pixel_art_wallpapers.jpeg',
                fit: BoxFit.cover,
              ),
            ),

            // Capa de glassmorphism
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(180), // Vidrio tenue
                    borderRadius: BorderRadius.circular(0), // si es necesario
                    border: Border.all(
                      color: Colors.black.withAlpha(280),
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      textAlign: TextAlign.justify,
                      "El contenido estará en inglés de ahora en adelante. ",
                      style: AppTextStyles.bodyMovingText,
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
