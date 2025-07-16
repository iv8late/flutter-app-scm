import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/courses/classes/course.dart';
import 'package:project_base_app/modules/courses/theme_courses_detail.dart';
import 'package:project_base_app/modules/layout/space_background_layout.dart';

class ThemesMenu extends StatefulWidget {
  const ThemesMenu({super.key});

  @override
  State<ThemesMenu> createState() => _ThemesMenuState();
}

class _ThemesMenuState extends State<ThemesMenu> {
  final themeCourses = [
    ThemeCourse(
      title: 'THEME 1',
      status: 'completed',
      content: 'Learn about common error vocabulary',
      courses: [
        Course(
          title: 'Course 1',
          subtitle: 'Sub 1',
          content: 'Details',
          lessons: [
            Lesson(
              title: 'title',
              subtitle: 'subtitle',
              content: 'content is undefined',
              isUnlocked: true,
              lessonContent: [],
            ),
            Lesson(
              title: 'title',
              subtitle: 'subtitle',
              content: 'content is undefined',
              isUnlocked: false,
              lessonContent: [],
            ),
            Lesson(
              title: 'title',
              subtitle: 'subtitle',
              content: 'content is undefined',
              isUnlocked: false,
              lessonContent: [],
            ),
            Lesson(
              title: 'title',
              subtitle: 'subtitle',
              content: 'content is undefined',
              isUnlocked: false,
              lessonContent: [],
            ),
            Lesson(
              title: 'title',
              subtitle: 'subtitle',
              content: 'content is undefined',
              isUnlocked: false,
              lessonContent: [],
            ),
          ],
        ),
        Course(
          title: 'Course 2',
          subtitle: 'Sub 2',
          content: 'Details 2',
          lessons: [
            Lesson(
              title: 'title',
              subtitle: 'subtitle',
              content: '',
              isUnlocked: true,
              lessonContent: [],
            ),
          ],
        ),
        Course(
          title: 'Course 3',
          subtitle: 'Sub 2',
          content: 'Details 2',
          lessons: [
            Lesson(
              title: 'title',
              subtitle: 'subtitle',
              content: '',
              isUnlocked: true,
              lessonContent: [],
            ),
            Lesson(
              title: 'title',
              subtitle: 'subtitle',
              content: '',
              isUnlocked: true,
              lessonContent: [],
            ),
          ],
        ),
      ],
    ),
    ThemeCourse(
      title: 'THEME 2',
      status: 'Courses: 0',
      content: 'Learn about vocabulary',
      courses: [
        Course(
          title: 'Course 1',
          subtitle: 'Sub 1',
          content: 'Details',
          lessons: [],
        ),
        Course(
          title: 'Course 1',
          subtitle: 'Sub 1',
          content: 'Details',
          lessons: [],
        ),
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
                  itemCount: themeCourses.length,
                  itemBuilder: (context, index) {
                    final item = themeCourses[index];
                    final isActive = index == currentPage.round();
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => ThemeCoursesDetail(
                                    item: themeCourses[index],
                                  ),
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
                                    item.courses.isNotEmpty
                                        ? item.courses[0].title
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
