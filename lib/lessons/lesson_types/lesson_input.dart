import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/courses/classes/course.dart';
import 'package:project_base_app/shared/lesson_json_content.dart';

class InputLesson extends StatefulWidget {
  final LessonScm lesson;
  final LessonContentScm content;

  const InputLesson({super.key, required this.lesson, required this.content});

  @override
  State<InputLesson> createState() => _InputLessonState();
}

class _InputLessonState extends State<InputLesson> {
  late final LessonContentData data;
  final TextEditingController _controller = TextEditingController();
  String? feedback;
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    data = LessonContentData.fromJson(widget.content.content);
  }

  @override
  Widget build(BuildContext context) {
    final exerciseRaw = widget.content.content['exercise'] ?? [];
    final exercises =
        (exerciseRaw as List<dynamic>)
            .map((e) => Exercise.fromJson(e))
            .toList();

    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título principal
              Text(
                data.title.es,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Introducción
              if (data.textContents.introduction?.isNotEmpty ?? false)
                ...data.textContents.introduction!.map(
                  (text) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      text.es,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),

              const SizedBox(height: 16),

              // Tabla de analogías
              if (data.tableContent?.isNotEmpty ?? false)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Analogías:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Table(
                      border: TableBorder.all(color: Colors.white24),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(3),
                        2: FlexColumnWidth(3),
                      },
                      children: [
                        const TableRow(
                          decoration: BoxDecoration(color: Colors.white10),
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Elemento',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Analogía',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Descripción',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        ...data.tableContent!.map(
                          (row) => TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  row.element.es,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  row.example.es,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  row.description.es,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

              const SizedBox(height: 24),

              // Ejercicios
              ...exercises.map((ex) {
                if (ex.type == 'options') {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ex.instruction.es,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...?ex.options?.map((opt) {
                        return ListTile(
                          title: Text(
                            opt.text,
                            style: const TextStyle(color: Colors.white),
                          ),
                          tileColor: Colors.white12,
                          onTap: () {
                            setState(() {
                              feedback = opt.output;
                              isCorrect = opt.correct;
                            });
                          },
                        );
                      }),
                      if (feedback != null)
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(top: 8),
                          color: isCorrect ? Colors.green : Colors.red,
                          child: Text(
                            feedback!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      const Divider(color: Colors.white),
                    ],
                  );
                } else if (ex.type == 'input') {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ex.instruction.es,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _controller,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Escribe aquí...',
                          hintStyle: TextStyle(color: Colors.white54),
                          border: OutlineInputBorder(),
                          fillColor: Colors.white10,
                          filled: true,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          final input = _controller.text.trim();
                          final isMatch = input == ex.input;
                          setState(() {
                            feedback = isMatch ? ex.output : ex.eoutput;
                            isCorrect = isMatch;
                          });
                        },
                        child: const Text('Enviar'),
                      ),
                      if (feedback != null)
                        Container(
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.only(top: 8),
                          color: isCorrect ? Colors.green : Colors.red,
                          child: Text(
                            feedback!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      const Divider(color: Colors.white),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),

              // Final
              if (data.textContents.ending?.isNotEmpty ?? false)
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '😊 Conclusión:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...data.textContents.ending!.map(
                        (text) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            text.es,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
