import 'package:flutter/material.dart';
import 'package:project_base_app/shared/lesson_json_content.dart';
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

    return GestureDetector(
      onTap: _nextCard,
      child: Card(
        color: Colors.white,
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.translate),
                  onPressed: () => widget.onLanguageToggle(!widget.isSpanish),
                ),
              ),
              RichText(text: TextSpan(children: textSpans)),
            ],
          ),
        ),
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
            style: const TextStyle(color: Colors.black),
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
                color: Colors.black87,
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
          style: const TextStyle(color: Colors.black),
        ),
      );
    }

    return spans;
  }
}
