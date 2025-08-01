import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/courses/classes/course.dart';
import 'package:project_base_app/modules/layout/space_background_layout.dart';

class CourseLessonsDetail extends StatelessWidget {
  final CourseScm item;

  const CourseLessonsDetail({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
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

          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(color: AppTheme.white.withAlpha(140)),
            ),
          ),

          Container(
            height: screenHeight * 0.25,
            width: screenWidth,
            decoration: BoxDecoration(
              color: AppTheme.darkBlue,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: screenHeight * 0.04,
                top: screenHeight * 0.08,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.white,
                      shadows: [
                        Shadow(
                          color: AppTheme.primaryDark,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                        ),
                        Shadow(
                          color: AppTheme.primaryDark,
                          offset: Offset(2, 2),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    item.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppTheme.lightblue,
                      fontStyle: FontStyle.italic,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenHeight * 0.28),
                  const Text(
                    "Lecciones disponibles:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.white,
                      shadows: [
                        Shadow(
                          color: AppTheme.primaryDark,
                          offset: Offset(2, 2),
                          blurRadius: 50,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),

                  Expanded(
                    child: ListView.builder(
                      itemCount: item.lessons.length,
                      itemBuilder: (context, index) {
                        final sub = item.lessons[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/lesson',
                              arguments: item.lessons[index],
                            );
                            // else {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(content: Text('Lección bloqueada')),
                            //   );
                            // }
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: screenHeight * 0.02,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppTheme.darkBlue,
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      vertical: screenWidth * 0.02,
                                      horizontal: screenWidth * 0.03,
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
                                                  fontSize: screenWidth * 0.04,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                sub.description,
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: screenWidth * 0.03,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // 🔒 Overlay si está bloqueado
                                  if (!sub.isUnlocked)
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppTheme.darkBlue.withAlpha(
                                            40,
                                          ),
                                        ),
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 3,
                                            sigmaY: 3,
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.lock_outline,
                                              color: AppTheme.white,
                                              size: screenWidth * 0.1,
                                              shadows: [
                                                Shadow(
                                                  color: AppTheme.primaryDark,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 10,
                                                ),
                                                Shadow(
                                                  color: AppTheme.primaryDark,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
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
                    border: Border.all(color: AppTheme.lightblue, width: 4),
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
