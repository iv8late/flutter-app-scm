import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/layout/space_background_layout.dart';
import 'package:project_base_app/modules/principal/themes_menu.dart';
import 'package:project_base_app/shared/widgets/bottom_buttons.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpaceBackgroundLayout(
        child: Stack(
          children: [
            SafeArea(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ThemesMenu()),
                  );
                },
                child: ThemesMenu(),
              ),
            ),

            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: Container(
                  color: AppTheme.primaryDark.withAlpha(
                    160,
                  ), // Ajusta la opacidad para más oscuridad
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: AppTheme.white.withAlpha(10),
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(height: 100),
                    Text(
                      'HI, USER',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Ready to explore?',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // base
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipPath(
                clipper: BottomRightTriangleClipper(),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppTheme.white, AppTheme.lightestPurple],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 10,
              left: 10,
              right: 0,
              child: Stack(
                alignment: Alignment.bottomLeft,
                clipBehavior: Clip.none,
                children: [
                  // Botones izquierda y derecha
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      diamondButton(
                        onTap: () {},
                        borderColor: AppTheme.darkestPurple,
                        color: Colors.white,
                        bgcolor: AppTheme.darkestPurple,
                        width: 70,
                        icon: Icons.integration_instructions_outlined,
                      ),
                      const SizedBox(width: 10),
                      diamondButton(
                        onTap: () {},
                        borderColor: AppTheme.darkestPurple,
                        color: Colors.white,
                        bgcolor: AppTheme.darkestPurple,
                        width: 70,
                        icon: Icons.book_outlined,
                      ),
                    ],
                  ),

                  Positioned(
                    left: 40,
                    bottom: 40,
                    child: Row(
                      children: [
                        diamondButton(
                          onTap: () {},
                          borderColor: AppTheme.darkPurple,
                          color: Colors.white,
                          bgcolor: AppTheme.darkPurple,
                          width: 70,
                          icon: Icons.psychology_alt_outlined,
                        ),
                        const SizedBox(width: 10),
                        diamondButton(
                          onTap: () {},
                          borderColor: AppTheme.darkPurple,
                          color: Colors.white,
                          bgcolor: AppTheme.darkPurple,
                          width: 50,
                          icon: Icons.psychology_alt_outlined,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Botón circular
            Positioned(
              bottom: 130,
              left: 10,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/themes');
                  },
                  child: Hero(
                    tag: 'courses-hero',
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppTheme.blue, // fondo
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppTheme.lightblue, // Borde blanco
                          width: 4,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.blue,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 180,
              left: 60,
              child: ArcText(
                radius: 50,
                text: 'continue learning  ',
                textStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                startAngle: -1 / 1.5, // Empieza desde arriba del círculo
                placement: Placement.outside, // o inside
                direction: Direction.clockwise, // dirección del arco
              ),
            ),
          ],
        ),
      ),
    );
  }
}
