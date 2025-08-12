import 'package:project_base_app/shared/json_classes/exercise_json.dart';

class LessonContentData {
  final LocalizedText title;
  final TextContents? textContents;
  final List<Exercise>? exercises;
  final List<TableContents>? tables;
  final List<VocabularyItem>? vocabulary;
  final String? backgroundColor;
  final Avatar? avatar;

  LessonContentData({
    required this.title,
    this.textContents,
    this.exercises,
    this.tables,
    this.vocabulary,
    this.backgroundColor,
    this.avatar,
  });

  factory LessonContentData.fromJson(Map<String, dynamic> json) {
    return LessonContentData(
      title: LocalizedText.fromJson(json['title']),
      textContents:
          json['textContents'] != null
              ? TextContents.fromJson(json['textContents'])
              : null,
      exercises:
          (json['exercise'] as List<dynamic>?)
              ?.map((e) => Exercise.fromJson(e))
              .toList(),
      tables:
          (json['tables'] as List<dynamic>?)
              ?.map((e) => TableContents.fromJson(e))
              .toList(),
      vocabulary:
          (json['vocabulary'] as List<dynamic>?)
              ?.map((e) => VocabularyItem.fromJson(e))
              .toList(),
      backgroundColor: json['backgroundColor'],
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

class TableContents {
  final LocalizedText? title;
  final List<TableContent>? tableContent;

  TableContents({this.title, this.tableContent});

  factory TableContents.fromJson(Map<String, dynamic> json) {
    return TableContents(
      title:
          json['title'] != null ? LocalizedText.fromJson(json['title']) : null,
      tableContent:
          (json['tableContent'] as List<dynamic>?)
              ?.map((e) => TableContent.fromJson(e))
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
  final String position;

  Avatar({required this.name, required this.position});

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      name: json['name'] ?? '',
      position: json['position'] ?? 'bottomLeft',
    );
  }
}
