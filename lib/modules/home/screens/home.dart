import 'package:flutter/material.dart';
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
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),

                    TextField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          stops: [.5, .5],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [Colors.green, Colors.transparent],
                        ),
                      ),
                    ),

                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        rectangleTriangleButton(
                          onTap: () {},
                          color: Colors.blue,
                          icon: Icons.arrow_back,
                          direction: TriangleDirection.left,
                        ),
                        const SizedBox(width: 40),
                        rectangleTriangleButton(
                          onTap: () {},
                          color: Colors.blue,
                          icon: Icons.arrow_forward,
                          direction: TriangleDirection.right,
                        ),
                      ],
                    ),

                    Positioned(
                      bottom: 20,
                      child: diamondButton(
                        onTap: () {},
                        color: Colors.purple,
                        width: 70,
                        icon: Icons.home,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
