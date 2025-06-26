import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/layout/glass_background_layout.dart';
import 'package:project_base_app/modules/principal/menu_courses.dart';
import 'package:project_base_app/shared/widgets/bottom_buttons.dart';

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
      body: GlassBackgroundLayout(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(10),
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 50),
                    Text(
                      'Hi, USER',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Ready to explore?',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipPath(
                clipper: BottomRightTriangleClipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: AppTheme.white,
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
                        borderColor: AppTheme.blue,
                        color: Colors.white,
                        bgcolor: AppTheme.blue,
                        width: 70,
                        icon: Icons.integration_instructions_outlined,
                      ),
                      const SizedBox(width: 10),
                      diamondButton(
                        onTap: () {},
                        borderColor: AppTheme.blue,
                        color: Colors.white,
                        bgcolor: AppTheme.blue,
                        width: 70,
                        icon: Icons.book_outlined,
                      ),
                    ],
                  ),

                  // Positioned(
                  //   bottom: 40,
                  //   child: diamondButton(
                  //     onTap: () {},
                  //     borderColor: AppTheme.blue,
                  //     color: Colors.white,
                  //     bgcolor: AppTheme.blue,
                  //     width: 140,
                  //     icon: Icons.psychology_alt_outlined,
                  //   ),
                  // ),
                  Positioned(
                    left: 40,
                    bottom: 40,
                    child: diamondButton(
                      onTap: () {},
                      borderColor: AppTheme.blue,
                      color: Colors.white,
                      bgcolor: AppTheme.blue,
                      width: 70,
                      icon: Icons.psychology_alt_outlined,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 130,
              left: 10,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/courses');
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue, // Color de fondo del círculo
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white, // Borde blanco
                        width: 4,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 230,
              left: 10,
              child: Text(
                'Continue learning',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Hero(
              tag: 'courses-hero',
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MenuCourses()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
