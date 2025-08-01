import 'package:flutter/material.dart';
import 'package:project_base_app/lessons/lesson_types/lesson_input.dart';
import 'package:project_base_app/lessons/lesson_types/lesson_intro.dart';
import 'package:project_base_app/lessons/lesson_types/lesson_code.dart';
import 'package:project_base_app/modules/courses/classes/course.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Enum para los tipos de lecciones
enum LessonType { introduction, code, input }

class LessonTemplatesMain extends StatefulWidget {
  final LessonScm item;
  const LessonTemplatesMain({super.key, required this.item});

  @override
  State<LessonTemplatesMain> createState() => _LessonTemplatesMainState();
}

class _LessonTemplatesMainState extends State<LessonTemplatesMain> {
  final PageController _controller = PageController();

  // Determinar el tipo de lección según lessonContent.typeId
  LessonType getLessonType(int typeId) {
    switch (typeId) {
      case 1:
        return LessonType.introduction; // `1` corresponde a Introduction
      case 2:
        return LessonType.code; // `2` corresponde a Code Lesson
      case 3:
        return LessonType.input; // `3` corresponde a Input Lesson
      default:
        return LessonType.introduction; // Default to Introduction
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> lessonPages =
        widget.item.lessonContent.map((lessonContent) {
          LessonType lessonType = getLessonType(lessonContent.typeId);

          switch (lessonType) {
            case LessonType.introduction:
              return IntroLesson(lesson: widget.item, content: lessonContent);
            case LessonType.code:
              return CodeLesson(lesson: widget.item, content: lessonContent);
            case LessonType.input:
              return InputLesson(lesson: widget.item, content: lessonContent);
          }
        }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Lecciones')),
      body: Stack(
        children: [
          // Página de lecciones
          PageView(
            controller: _controller,
            children:
                lessonPages, // Aquí pasamos las páginas según lessonContent
          ),
          // Indicador de página
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: lessonPages.length,
                ),
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
