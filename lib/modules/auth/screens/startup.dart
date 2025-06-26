import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/layout/glass_background_layout.dart';
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
      body: GlassBackgroundLayout(
        child: Stack(
          children: [
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
