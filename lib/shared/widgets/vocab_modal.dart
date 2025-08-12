import 'package:flutter/material.dart';
import 'package:project_base_app/shared/json_classes/lesson_json_content.dart';

class VocabModal extends StatelessWidget {
  final VocabularyItem vocab;
  final bool isSpanish;

  const VocabModal({super.key, required this.vocab, required this.isSpanish});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(vocab.term),
      content: Text(isSpanish ? vocab.definition.es : vocab.definition.en),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cerrar"),
        ),
      ],
    );
  }
}
