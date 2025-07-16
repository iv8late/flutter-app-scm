import 'package:flutter/material.dart';
import 'package:project_base_app/lessons/lesson_types/lesson_input.dart';
import 'package:project_base_app/lessons/lesson_types/lesson_intro.dart';
import 'package:project_base_app/lessons/lesson_types/lesson_select.dart';
import 'package:project_base_app/modules/courses/classes/course.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LessonTemplatesMain extends StatefulWidget {
  final Lesson item;
  const LessonTemplatesMain({super.key, required this.item});

  @override
  State<LessonTemplatesMain> createState() => _LessonTemplatesMainState();
}

class _LessonTemplatesMainState extends State<LessonTemplatesMain> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(children: [IntroLesson(), SelectLesson(), InputLesson()]),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmoothPageIndicator(controller: _controller, count: 3),
                GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.bounceIn,
                    );
                  },
                  child: Text('next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
