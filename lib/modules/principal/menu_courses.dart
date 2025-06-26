import 'package:flutter/material.dart';
import 'package:project_base_app/modules/layout/glass_background_layout.dart';

class MenuCourses extends StatefulWidget {
  const MenuCourses({super.key});

  @override
  State<MenuCourses> createState() => _MenuCoursesState();
}

class _MenuCoursesState extends State<MenuCourses> {
  final List<String> items = ['d', 'e', 'gf'];
  final controller = PageController(viewportFraction: 0.60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GlassBackgroundLayout(
        child: Hero(
          tag: 'courses-hero',
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: PageView.builder(
                  controller: controller,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (context, child) {
                          double scale = 1.0;
                          if (controller.hasClients &&
                              controller.page != null) {
                            final pageOffset = controller.page!;
                            final diff = (pageOffset - index).abs();
                            scale = 1.0 - (0.2 * diff).clamp(0.0, 0.2);
                          }

                          return Center(
                            child: Transform.scale(
                              scale: scale,
                              child: SizedBox(
                                height: 180,
                                child: Card(
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  color: Colors.blueAccent,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        items[index],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
