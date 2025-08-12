import 'package:project_base_app/shared/json_classes/lesson_json_content.dart';

class Exercise {
  final String type;
  final LocalizedText instruction;
  final bool completed;

  // opciones
  final List<ExerciseOption>? options;

  // input
  final String? input;
  final String? output; // cuando es un string simple
  final String? eoutput;

  // match
  final List<MatchItem>? left;
  final List<MatchItem>? right;
  final List<MatchPair>? pairs;

  Exercise({
    required this.type,
    required this.instruction,
    required this.completed,
    this.options,
    this.input,
    this.output,
    this.eoutput,
    this.left,
    this.right,
    this.pairs,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      type: json['type'] ?? '',
      instruction:
          json['instruction'] != null
              ? LocalizedText.fromJson(json['instruction'])
              : LocalizedText(en: '', es: ''),
      completed: json['completed'] ?? false,
      options:
          (json['options'] as List?)
              ?.map((o) => ExerciseOption.fromJson(o))
              .toList(),
      input: json['input'],
      output: json['output'] is String ? json['output'] : null,
      eoutput: json['eoutput'],
      left: (json['left'] as List?)?.map((e) => MatchItem.fromJson(e)).toList(),
      right:
          (json['right'] as List?)?.map((e) => MatchItem.fromJson(e)).toList(),
      pairs:
          (json['pairs'] as List?)?.map((e) => MatchPair.fromJson(e)).toList(),
    );
  }
}

class ExerciseOption {
  final String text;
  final bool correct;
  final LocalizedText? localizedOutput;
  final String? outputString;

  ExerciseOption({
    required this.text,
    required this.correct,
    this.localizedOutput,
    this.outputString,
  });

  factory ExerciseOption.fromJson(Map<String, dynamic> json) {
    final outputData = json['output'];
    LocalizedText? loc;
    String? str;
    if (outputData is Map<String, dynamic>) {
      loc = LocalizedText.fromJson(outputData);
    } else if (outputData is String) {
      str = outputData;
    }
    return ExerciseOption(
      text: json['text'] ?? '',
      correct: json['correct'] ?? false,
      localizedOutput: loc,
      outputString: str,
    );
  }
}

class MatchItem {
  final String id;
  final String text;

  MatchItem({required this.id, required this.text});

  factory MatchItem.fromJson(Map<String, dynamic> json) {
    return MatchItem(id: json['id'], text: json['text']);
  }
}

class MatchPair {
  final String left;
  final String right;

  MatchPair({required this.left, required this.right});

  factory MatchPair.fromJson(Map<String, dynamic> json) {
    return MatchPair(left: json['left'], right: json['right']);
  }
}
