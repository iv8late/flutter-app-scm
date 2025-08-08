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

            // INTRODUCCIÓN con fondo
            if (data.textContents.introduction != null &&
                data.textContents.introduction!.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppTheme.blue,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      data.textContents.introduction!
                          .map(
                            (intro) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text(
                                isSpanish ? intro.es : intro.en,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
                          .toList(),
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

            const SizedBox(height: 16),

            // ENDING como ExpansionTile
            if (data.textContents.ending != null &&
                data.textContents.ending!.isNotEmpty)
              _buildEndingSection(data.textContents.ending!),

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
              _buildAnalogyCards(data),

            const SizedBox(height: 16),

            // AVATAR
            if (data.avatar != null) _buildAvatar(data.avatar!),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalogyCards(LessonContentData data) {
    final table = data.tableContent!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isSpanish ? 'Analogías' : 'Analogies',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.white,
          ),
        ),
        const SizedBox(height: 10),
        ...table.map(
          (row) => Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.label_important,
                        color: AppTheme.darkBlue,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isSpanish ? row.element.es : row.element.en,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.darkBlue,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text("📝 ", style: TextStyle(fontSize: 18)),
                      Expanded(
                        child: Text(
                          isSpanish ? row.description.es : row.description.en,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          isSpanish ? row.example.es : row.example.en,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Header de tabla
  Widget _tableHeader(String text) => Padding(
    padding: const EdgeInsets.all(8),
    child: Text(
      isSpanish ? text : _translateHeader(text),
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );

  // Celdas de tabla
  Widget _tableCell(String? text) => Padding(
    padding: const EdgeInsets.all(8),
    child: Text(
      text?.isNotEmpty == true ? text! : '—',
      style: const TextStyle(color: Colors.white),
    ),
  );

  // Traducciones de headers
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

  // Avatar
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

  // ENDING como ExpansionTile
  Widget _buildEndingSection(List<LocalizedText> endings) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        collapsedTextColor: Colors.white,
        collapsedIconColor: Colors.white,
        iconColor: Colors.white,
        textColor: Colors.white,
        tilePadding: const EdgeInsets.symmetric(horizontal: 0),
        title: Text(
          isSpanish ? endings.first.es : endings.first.en,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        children:
            endings
                .skip(1)
                .map(
                  (end) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      isSpanish ? end.es : end.en,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }
}
