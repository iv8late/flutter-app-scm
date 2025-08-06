import 'package:flutter/material.dart';
import 'package:project_base_app/config/theme/app_theme.dart';
import 'package:project_base_app/modules/courses/classes/course.dart';
import 'package:project_base_app/shared/lesson_json_content.dart';
import 'package:project_base_app/shared/widgets/text_contents_card.dart';

class IntroLesson extends StatefulWidget {
  final LessonScm lesson;
  final LessonContentScm content;

  const IntroLesson({super.key, required this.lesson, required this.content});

  @override
  State<IntroLesson> createState() => _IntroLessonState();
}

class _IntroLessonState extends State<IntroLesson> {
  bool isSpanish = false;

  @override
  Widget build(BuildContext context) {
    final data = LessonContentData.fromJson(widget.content.content);
    final backgroundColor = AppTheme.darkBlue;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Text(isSpanish ? 'Lección' : 'Lesson'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            tooltip: 'Cambiar idioma',
            onPressed: () => setState(() => isSpanish = !isSpanish),
          ),
          if (data.vocabulary != null && data.vocabulary!.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.menu_book),
              tooltip: 'Vocabulario',
              onPressed:
                  () => showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    builder:
                        (context) => ListView(
                          padding: const EdgeInsets.all(16),
                          children:
                              data.vocabulary!
                                  .map(
                                    (v) => ListTile(
                                      title: Text(v.term),
                                      subtitle: Text(
                                        isSpanish
                                            ? v.definition.es
                                            : v.definition.en,
                                      ),
                                    ),
                                  )
                                  .toList(),
                        ),
                  ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TÍTULO
            Text(
              isSpanish ? data.title.es : data.title.en,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppTheme.white,
              ),
            ),
            const SizedBox(height: 16),

            // INTRODUCCIÓN
            if (data.textContents.introduction != null &&
                data.textContents.introduction!.isNotEmpty)
              ...data.textContents.introduction!.map(
                (intro) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    isSpanish ? intro.es : intro.en,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

            // CONCEPTO
            if (data.textContents.concept != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  isSpanish
                      ? data.textContents.concept!.es
                      : data.textContents.concept!.en,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

            // CONTENIDOS
            if (data.textContents.contents != null &&
                data.textContents.contents!.isNotEmpty)
              TextContentsCard(
                content: data.textContents,
                vocabulary: data.vocabulary ?? [],
                isSpanish: isSpanish,
                onLanguageToggle: (value) {
                  setState(() {
                    isSpanish = value;
                  });
                },
              ),

            // ENDING
            if (data.textContents.ending != null &&
                data.textContents.ending!.isNotEmpty)
              ...data.textContents.ending!.map(
                (end) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    isSpanish ? end.es : end.en,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),

            const SizedBox(height: 16),

            // EJERCICIOS
            if (data.exercises != null && data.exercises!.isNotEmpty)
              ...data.exercises!.map((ex) {
                if (ex.type == 'options') {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isSpanish ? ex.instruction.es : ex.instruction.en,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...?ex.options?.map((opt) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: ListTile(
                            tileColor: Colors.white10,
                            title: Text(
                              opt.text,
                              style: const TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              final correct = opt.correct;
                              final result = opt.output;

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(result),
                                  backgroundColor:
                                      correct ? Colors.green : Colors.red,
                                ),
                              );
                            },
                          ),
                        );
                      }),
                      const SizedBox(height: 16),
                    ],
                  );
                }
                return const SizedBox.shrink();
              }),

            // TABLA DE ANALOGÍAS
            if (data.tableContent != null && data.tableContent!.isNotEmpty)
              _buildAnalogyTable(data),

            const SizedBox(height: 16),

            // AVATAR
            if (data.avatar != null) _buildAvatar(data.avatar!),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalogyTable(LessonContentData data) {
    final table = data.tableContent!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isSpanish ? 'Analogías' : 'Analogies',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.white,
          ),
        ),
        const SizedBox(height: 8),
        Table(
          columnWidths: const {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
          },
          border: TableBorder.all(color: Colors.white24),
          children: [
            TableRow(
              decoration: const BoxDecoration(color: AppTheme.purple),
              children: [
                _tableHeader('Elemento'),
                _tableHeader('Analogía'),
                _tableHeader('Descripción'),
              ],
            ),
            ...table.map(
              (row) => TableRow(
                children: [
                  _tableCell(isSpanish ? row.element.es : row.element.en),
                  _tableCell(isSpanish ? row.example.es : row.example.en),
                  _tableCell(
                    isSpanish ? row.description.es : row.description.en,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _tableHeader(String text) => Padding(
    padding: const EdgeInsets.all(8),
    child: Text(
      isSpanish ? text : _translateHeader(text),
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );

  Widget _tableCell(String? text) => Padding(
    padding: const EdgeInsets.all(8),
    child: Text(
      text?.isNotEmpty == true ? text! : '—',
      style: const TextStyle(color: Colors.white),
    ),
  );

  String _translateHeader(String esHeader) {
    switch (esHeader) {
      case 'Elemento':
        return 'Element';
      case 'Analogía':
        return 'Analogy';
      case 'Descripción':
        return 'Description';
      default:
        return esHeader;
    }
  }

  Widget _buildAvatar(Avatar avatar) {
    return Align(
      alignment:
          avatar.position == 'bottomLeft'
              ? Alignment.bottomLeft
              : Alignment.bottomRight,
      child: CircleAvatar(
        backgroundImage: NetworkImage(avatar.imageUrl),
        radius: 28,
      ),
    );
  }
}
