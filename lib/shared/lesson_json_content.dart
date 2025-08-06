class LessonContentData {
  final LocalizedText title;
  final TextContents textContents;
  final List<Exercise>? exercises;
  final List<TableContent>? tableContent;
  final List<VocabularyItem>? vocabulary;
  final String? imageUrl;
  final String? backgroundColor;
  final String? audioUrl;
  final Avatar? avatar;

  LessonContentData({
    required this.title,
    required this.textContents,
    this.exercises,
    this.tableContent,
    this.vocabulary,
    this.imageUrl,
    this.backgroundColor,
    this.audioUrl,
    this.avatar,
  });

  factory LessonContentData.fromJson(Map<String, dynamic> json) {
    return LessonContentData(
      title: LocalizedText.fromJson(json['title']),
      textContents: TextContents.fromJson(json['textContents']),
      exercises:
          (json['textContents']?['exercise'] as List<dynamic>?)
              ?.map((e) => Exercise.fromJson(e))
              .toList(),
      tableContent:
          (json['table'] as List<dynamic>?)
              ?.map((e) => TableContent.fromJson(e))
              .toList(),
      vocabulary:
          (json['vocabulary'] as List<dynamic>?)
              ?.map((e) => VocabularyItem.fromJson(e))
              .toList(),
      imageUrl: json['imageUrl'],
      backgroundColor: json['backgroundColor'],
      audioUrl: json['audioUrl'],
      avatar: json['avatar'] != null ? Avatar.fromJson(json['avatar']) : null,
    );
  }
}

class LocalizedText {
  final String en;
  final String es;

  LocalizedText({required this.en, required this.es});

  factory LocalizedText.fromJson(Map<String, dynamic> json) {
    return LocalizedText(en: json['en'] ?? '', es: json['es'] ?? '');
  }
}

class TextContents {
  final LocalizedText? concept;
  final List<LocalizedText>? introduction;
  final List<LocalizedText>? ending;
  final List<LocalizedText>? contents;

  TextContents({this.concept, this.introduction, this.ending, this.contents});

  factory TextContents.fromJson(Map<String, dynamic> json) {
    return TextContents(
      concept:
          json['concept'] != null
              ? LocalizedText.fromJson(json['concept'])
              : null,
      introduction:
          (json['introduction'] as List<dynamic>?)
              ?.map((e) => LocalizedText.fromJson(e))
              .toList(),
      ending:
          (json['ending'] as List<dynamic>?)
              ?.map((e) => LocalizedText.fromJson(e))
              .toList(),
      contents:
          (json['contents'] as List<dynamic>?)
              ?.map((e) => LocalizedText.fromJson(e))
              .toList(),
    );
  }
}

class TableContent {
  final LocalizedText element;
  final LocalizedText example;
  final LocalizedText description;

  TableContent({
    required this.element,
    required this.example,
    required this.description,
  });

  factory TableContent.fromJson(Map<String, dynamic> json) {
    return TableContent(
      element: LocalizedText.fromJson(json['element']),
      example: LocalizedText.fromJson(json['example']),
      description: LocalizedText.fromJson(json['description']),
    );
  }
}

class Exercise {
  final String type; // "options" o "input"
  final LocalizedText instruction;
  final bool? completed;

  // Para opciones
  final List<ExerciseOption>? options;

  // Para input
  final String? input;
  final String? output;
  final String? eoutput;

  Exercise({
    required this.type,
    required this.instruction,
    this.completed,
    this.options,
    this.input,
    this.output,
    this.eoutput,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      type: json['type'],
      instruction: LocalizedText.fromJson(json['instruction']),
      completed: json['completed'] ?? false,
      options:
          (json['options'] as List<dynamic>?)
              ?.map((o) => ExerciseOption.fromJson(o))
              .toList(),
      input: json['input'],
      output: json['output'],
      eoutput: json['eoutput'],
    );
  }
}

class ExerciseOption {
  final String text;
  final bool correct;
  final String output;

  ExerciseOption({
    required this.text,
    required this.correct,
    required this.output,
  });

  factory ExerciseOption.fromJson(Map<String, dynamic> json) {
    return ExerciseOption(
      text: json['text'],
      correct: json['correct'],
      output: json['output'],
    );
  }
}

class VocabularyItem {
  final String term;
  final LocalizedText definition;

  VocabularyItem({required this.term, required this.definition});

  factory VocabularyItem.fromJson(Map<String, dynamic> json) {
    return VocabularyItem(
      term: json['term'],
      definition: LocalizedText.fromJson(json['definition']),
    );
  }
}

class Avatar {
  final String name;
  final String imageUrl;
  final String position;

  Avatar({required this.name, required this.imageUrl, required this.position});

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      position: json['position'] ?? 'bottomLeft',
    );
  }
}
