import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/courses/course.dart';
import 'package:project_base_app/modules/layout/space_background_layout.dart';

class CourseMenu extends StatelessWidget {
  final Course item;

  const CourseMenu({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Fondo espacial similar a HomeScreen
          SpaceBackgroundLayout(
            child: Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bg/space_wallpaper.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // Capa de desenfoque para dar un efecto de profundidad
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(
                color: AppTheme.primaryDark.withAlpha(160), // Ajustar opacidad
              ),
            ),
          ),

          // Contenido del menú de cursos
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.05),
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Descripción del curso
                  Text(
                    item.content,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),

                  // Listado de sub-cursos (lecciones)
                  const Text(
                    "Lecciones disponibles:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Lista de lecciones (sub-cursos)
                  Expanded(
                    child: ListView.builder(
                      itemCount: item.subItems.length,
                      itemBuilder: (context, index) {
                        final sub = item.subItems[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/courseDetail', // Ruta la lección
                              arguments: sub,
                            );
                          },
                          child: Card(
                            color: Colors.transparent,
                            elevation: 8,
                            margin: EdgeInsets.only(
                              bottom: screenHeight * 0.02,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(screenWidth * 0.04),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blueAccent,
                                    Colors.purpleAccent,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.book_outlined,
                                    color: Colors.white,
                                    size: screenWidth * 0.08,
                                  ),
                                  SizedBox(width: screenWidth * 0.04),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          sub.title,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          sub.content,
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: screenWidth * 0.04,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 50,
            right: 20,
            child: GestureDetector(
              onTap: () {
                // Ir a la página principal de cursos
                Navigator.pushNamed(context, '/courses');
              },
              child: Hero(
                tag: 'courses-hero',
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppTheme.blue,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppTheme.lightblue, // Borde
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
                  child: Icon(
                    Icons.book_outlined,
                    color: Colors.white,
                    size: screenWidth * 0.06,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
