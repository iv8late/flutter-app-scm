import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/layout/glass_background_layout.dart';
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
      backgroundColor: Colors.transparent,
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

            // SafeArea(
            //   child: SingleChildScrollView(
            //     padding: const EdgeInsets.symmetric(horizontal: 32.0),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         const SizedBox(height: 24),
            //         Text(
            //           'Welcome',
            //           style: TextStyle(
            //             fontSize: 28,
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         const SizedBox(height: 24),

            //         TextField(
            //           controller: _emailController,
            //           style: const TextStyle(color: Colors.white),
            //           decoration: InputDecoration(
            //             hintText: 'Search',
            //             hintStyle: TextStyle(color: Colors.white70),
            //             filled: true,
            //             fillColor: Colors.white.withAlpha(10),
            //             border: OutlineInputBorder(
            //               borderRadius: BorderRadius.circular(12),
            //               borderSide: BorderSide.none,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
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
                      const SizedBox(width: 5),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
