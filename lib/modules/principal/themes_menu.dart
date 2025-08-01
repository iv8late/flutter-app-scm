import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/courses/classes/course.dart';
import 'package:project_base_app/modules/courses/theme_courses_detail.dart';
import 'package:project_base_app/modules/layout/space_background_layout.dart';
import 'package:project_base_app/services/theme_services.dart';

class ThemesMenu extends StatefulWidget {
  const ThemesMenu({super.key});

  @override
  State<ThemesMenu> createState() => _ThemesMenuState();
}

class _ThemesMenuState extends State<ThemesMenu> {
  List<ThemeScm> themeCourses = [];
  bool isLoading = true;

  final controller = PageController(
    viewportFraction: 0.4, // Muestra tarjetas más pequeñas (ajustable)
  );

  double currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    fetchCourseData();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
  }

  Future<void> fetchCourseData() async {
    try {
      final response = await fetchCourse();
      if (response.error == false && response.data != null) {
        setState(() {
          themeCourses = response.data!;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpaceBackgroundLayout(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 90),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text('all')),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('ongoing'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('completed'),
                  ),
                ],
              ),
              const SizedBox(height: 60),

              // Carrusel con tarjetas pequeñas
              SizedBox(
                height: 250, // Altura del carrusel
                child:
                    isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : PageView.builder(
                          controller: controller,
                          itemCount: themeCourses.length,
                          itemBuilder: (context, index) {
                            final item = themeCourses[index];

                            // Calcula la diferencia entre el índice y la página actual
                            final double scale = (1 -
                                    (currentPage - index).abs())
                                .clamp(0.85, 1.0);

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              ThemeCoursesDetail(item: item),
                                    ),
                                  );
                                },
                                child: Transform.scale(
                                  scale: scale,
                                  child: Card(
                                    elevation: 6,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    color: AppTheme.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.title,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: AppTheme.primaryDark,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            item.description,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: AppTheme.primaryDark,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
    );
  }
}
