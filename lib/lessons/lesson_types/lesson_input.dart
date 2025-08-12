import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/courses/classes/course.dart';
import 'package:project_base_app/shared/json_classes/exercise_json.dart';
import 'package:project_base_app/shared/json_classes/lesson_json_content.dart';

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
  bool isSpanish = false;

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
      appBar: AppBar(
        title: Text(isSpanish ? 'Lección' : 'Lesson'),
        backgroundColor: AppTheme.primaryDark,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            tooltip: 'Cambiar idioma',
            onPressed: () {
              setState(() {
                isSpanish = !isSpanish;
              });
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título
              Text(
                isSpanish ? data.title.es : data.title.en,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Introducción
              if (data.textContents?.introduction?.isNotEmpty ?? false)
                ...data.textContents!.introduction!.map(
                  (text) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      isSpanish ? text.es : text.en,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),

              const SizedBox(height: 16),

              // Tabla
              // Tabla
              if (data.tables?.isNotEmpty ?? false)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      data.tables!.map((tableSection) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (tableSection.title != null)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  isSpanish
                                      ? tableSection.title!.es
                                      : tableSection.title!.en,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
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
                                TableRow(
                                  decoration: const BoxDecoration(
                                    color: Colors.white10,
                                  ),
                                  children: [
                                    _buildTableHeader(
                                      isSpanish ? 'Elemento' : 'Element',
                                    ),
                                    _buildTableHeader(
                                      isSpanish ? 'Analogía' : 'Analogy',
                                    ),
                                    _buildTableHeader(
                                      isSpanish ? 'Descripción' : 'Description',
                                    ),
                                  ],
                                ),
                                ...?tableSection.tableContent?.map(
                                  (row) => TableRow(
                                    children: [
                                      _buildTableCell(
                                        isSpanish
                                            ? row.element.es
                                            : row.element.en,
                                      ),
                                      _buildTableCell(
                                        isSpanish
                                            ? row.example.es
                                            : row.example.en,
                                      ),
                                      _buildTableCell(
                                        isSpanish
                                            ? row.description.es
                                            : row.description.en,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                          ],
                        );
                      }).toList(),
                ),

              const SizedBox(height: 24),

              // Ejercicios
              ...exercises.map((ex) {
                if (ex.type == 'options') {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isSpanish ? ex.instruction.es : ex.instruction.en,
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
                              if (opt.localizedOutput != null) {
                                feedback =
                                    isSpanish
                                        ? opt.localizedOutput!.es
                                        : opt.localizedOutput!.en;
                              } else {
                                feedback = opt.outputString ?? '';
                              }
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
                        isSpanish ? ex.instruction.es : ex.instruction.en,
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
                } else if (ex.type == 'match') {
                  return _buildMatchExercise(ex);
                } else {
                  return const SizedBox.shrink();
                }
              }),

              // Final
              if (data.textContents?.ending?.isNotEmpty ?? false)
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isSpanish ? '😊 ' : '😊 ',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...data.textContents!.ending!.map(
                        (text) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            isSpanish ? text.es : text.en,
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

  // Tabla helper
  Widget _buildTableHeader(String text) => Padding(
    padding: const EdgeInsets.all(8),
    child: Text(text, style: const TextStyle(color: Colors.white)),
  );

  Widget _buildTableCell(String text) => Padding(
    padding: const EdgeInsets.all(8),
    child: Text(text, style: const TextStyle(color: Colors.white)),
  );

  // Match Exercise
  Widget _buildMatchExercise(Exercise ex) {
    final Map<String, String?> selectedMatches = {};
    final leftItems = ex.left ?? [];
    final rightItems = ex.right ?? [];
    final pairItems = ex.pairs ?? [];

    return StatefulBuilder(
      builder: (context, setInnerState) {
        final allSelected = selectedMatches.length == leftItems.length;
        final allCorrect = selectedMatches.entries.every((entry) {
          return pairItems.any(
            (pair) => pair.left == entry.key && pair.right == entry.value,
          );
        });

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isSpanish ? ex.instruction.es ?? '' : ex.instruction.en ?? '',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              ...leftItems.map((leftItem) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          leftItem.text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis, // 🔹 evita desbordes
                          maxLines:
                              2, // 🔹 permite que baje de línea si es necesario
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 5,
                        child: DropdownButtonFormField<String>(
                          isExpanded:
                              true, // 🔹 MUY importante para que use todo el ancho disponible
                          dropdownColor: AppTheme.darkBlue,
                          value: selectedMatches[leftItem.id],
                          hint: Text(
                            isSpanish
                                ? 'Seleccionar descripción'
                                : 'Select description',
                            style: const TextStyle(color: Colors.white70),
                            overflow: TextOverflow.ellipsis, // 🔹
                          ),
                          style: const TextStyle(color: Colors.white),
                          items:
                              rightItems
                                  .map(
                                    (r) => DropdownMenuItem(
                                      value: r.id,
                                      child: Text(
                                        r.text,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis, // 🔹
                                      ),
                                    ),
                                  )
                                  .toList(),
                          onChanged: (value) {
                            setInnerState(() {
                              selectedMatches[leftItem.id] = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed:
                    allSelected
                        ? () {
                          final color = allCorrect ? Colors.green : Colors.red;
                          final message =
                              allCorrect
                                  ? (isSpanish ? '¡Correcto!' : 'Correct!')
                                  : (isSpanish
                                      ? 'Algunas respuestas son incorrectas.'
                                      : 'Some answers are incorrect.');

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                              backgroundColor: color,
                            ),
                          );
                        }
                        : null,
                child: Text(
                  isSpanish ? 'Verificar respuestas' : 'Check Answers',
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
