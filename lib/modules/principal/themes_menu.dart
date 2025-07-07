import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/courses/course.dart';
import 'package:project_base_app/modules/courses/course_detail_page.dart';
import 'package:project_base_app/modules/layout/space_background_layout.dart';

class ThemesMenu extends StatefulWidget {
  const ThemesMenu({super.key});

  @override
  State<ThemesMenu> createState() => _ThemesMenuState();
}

class _ThemesMenuState extends State<ThemesMenu> {
  final courses = [
    Course(
      title: 'THEME 1',
      status: 'Completed',
      content: 'Learn about common error vocabulary',
      subItems: [
        SubCourse(title: 'Course 1', subtitle: 'Sub 1', content: 'Details'),
        SubCourse(title: 'Course 2', subtitle: 'Sub 2', content: 'Details 2'),
      ],
    ),
    Course(
      title: 'THEME 2',
      status: 'Completed',
      content: 'Learn about vocabulary',
      subItems: [
        SubCourse(title: 'Course 1', subtitle: 'Sub 1', content: 'Details'),
        SubCourse(title: 'Course 2', subtitle: 'Sub 2', content: 'Details 2'),
      ],
    ),
    Course(
      title: 'THEME 3',
      status: 'Completed',
      content: 'Learn about vocabulary',
      subItems: [
        SubCourse(title: 'Course 1', subtitle: 'Sub 1', content: 'Details'),
        SubCourse(title: 'Course 2', subtitle: 'Sub 2', content: 'Details 2'),
      ],
    ),
  ];

  final controller = PageController(viewportFraction: 0.60);
  double currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!;
      });
    });
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
              const SizedBox(height: 50),
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
              const SizedBox(height: 200),
              SizedBox(
                height: 200,
                width: 500,
                child: PageView.builder(
                  controller: controller,
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final item = courses[index];
                    final isActive = index == currentPage.round();
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      CourseDetailPage(item: courses[index]),
                            ),
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: isActive ? 250 : 200,
                          width: isActive ? 320 : 280,
                          child: Card(
                            elevation: isActive ? 10 : 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            color: AppTheme.white,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.primaryDark,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.status,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: AppTheme.primaryDark,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item.content,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppTheme.primaryDark,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    item.subItems.isNotEmpty
                                        ? item.subItems[0].title
                                        : 'No subitem',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
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
