import 'package:flutter/material.dart';
import 'package:project_base_app/shared/json_classes/lesson_json_content.dart';
import 'package:project_base_app/shared/widgets/vocab_modal.dart';

class TextContentsCard extends StatefulWidget {
  final TextContents content;
  final List<VocabularyItem> vocabulary;
  final bool isSpanish;
  final Function(bool) onLanguageToggle;

  const TextContentsCard({
    super.key,
    required this.content,
    required this.vocabulary,
    required this.isSpanish,
    required this.onLanguageToggle,
  });

  @override
  State<TextContentsCard> createState() => _TextContentsCardState();
}

class _TextContentsCardState extends State<TextContentsCard> {
  int currentIndex = 0;

  void _nextCard() {
    setState(() {
      if (currentIndex < (widget.content.contents?.length ?? 1) - 1) {
        currentIndex++;
      }
    });
  }

  void _showVocabulary(String word) {
    final matched = widget.vocabulary.firstWhere(
      (v) => v.term.toLowerCase() == word.toLowerCase(),
      orElse:
          () => VocabularyItem(
            term: word,
            definition: LocalizedText(
              en: 'No definition found',
              es: 'Sin definición',
            ),
          ),
    );

    showDialog(
      context: context,
      builder: (_) => VocabModal(vocab: matched, isSpanish: widget.isSpanish),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentText = widget.content.contents?[currentIndex];
    final text = widget.isSpanish ? currentText?.es : currentText?.en;
    final textSpans = _buildRichText(text ?? '');

    return Center(
      child: GestureDetector(
        onTap: _nextCard,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              alignment: Alignment.center,
              children: [
                // Tarjeta más al fondo
                Positioned(
                  top: 30,
                  child: _buildShadowCard(Colors.grey.shade300, scale: 0.92),
                ),
                // Tarjeta intermedia
                Positioned(
                  top: 15,
                  child: _buildShadowCard(Colors.grey.shade200, scale: 0.96),
                ),
                // Tarjeta principal con animación
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (child, animation) {
                    final offsetAnimation = Tween<Offset>(
                      begin: const Offset(0, 0.2),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(parent: animation, curve: Curves.easeOut),
                    );

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                  child: _buildMainCard(textSpans, key: ValueKey(currentIndex)),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMainCard(List<InlineSpan> textSpans, {Key? key}) {
    return Card(
      key: key,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      child: Container(
        width: 320,
        constraints: const BoxConstraints(minHeight: 150, maxHeight: 220),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.translate),
                onPressed: () => widget.onLanguageToggle(!widget.isSpanish),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(children: textSpans),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShadowCard(Color color, {double scale = 1.0}) {
    return Transform.scale(
      scale: scale,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: color,
        child: const SizedBox(height: 200, width: 320),
      ),
    );
  }

  List<InlineSpan> _buildRichText(String text) {
    final regex = RegExp(r'\*\*(.*?)\*\*');
    final matches = regex.allMatches(text);
    final spans = <InlineSpan>[];

    int lastIndex = 0;
    for (final match in matches) {
      if (match.start > lastIndex) {
        spans.add(
          TextSpan(
            text: text.substring(lastIndex, match.start),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18, // 📐 texto más grande
            ),
          ),
        );
      }

      final boldWord = match.group(1)!;
      spans.add(
        WidgetSpan(
          child: GestureDetector(
            onTap: () => _showVocabulary(boldWord),
            child: Text(
              boldWord,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontSize: 18, // tamaño del vocabulario resaltado
              ),
            ),
          ),
        ),
      );
      lastIndex = match.end;
    }

    if (lastIndex < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(lastIndex),
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      );
    }

    return spans;
  }
}
