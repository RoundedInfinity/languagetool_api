// To parse this JSON data, do
//
//     final languageToolAnswr = languageToolAnswerFromJson(jsonString);
// ignore_for_file: public_member_api_docs

import 'package:language_tool/src/model/language.dart';

class LanguageToolAnswerRaw {
  LanguageToolAnswerRaw({
    required this.software,
    required this.warnings,
    required this.language,
    required this.matches,
  });

  factory LanguageToolAnswerRaw.fromJson(Map<String, dynamic> json) =>
      LanguageToolAnswerRaw(
        software: Software.fromJson(json['software'] as Map<String, dynamic>),
        warnings: Warnings.fromJson(json['warnings'] as Map<String, dynamic>),
        language: Language.fromJson(json['language'] as Map<String, dynamic>),
        matches: (json['matches'] as Iterable)
            .map<Match>(
              (e) => Match.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );

  Software software;
  Warnings warnings;

  /// The language used for checking the text.
  Language language;
  List<Match> matches;

  Map<String, dynamic> toJson() => {
        'software': software.toJson(),
        'warnings': warnings.toJson(),
        'language': language.toJson(),
        'matches': List<dynamic>.from(matches.map((x) => x.toJson())),
      };
}

class Match {
  Match({
    required this.message,
    required this.shortMessage,
    required this.replacements,
    required this.offset,
    required this.length,
    required this.context,
    required this.sentence,
    required this.type,
    required this.rule,
    required this.ignoreForIncompleteSentence,
    required this.contextForSureMatch,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        message: json['message'] as String,
        shortMessage: json['shortMessage'] as String,
        replacements: (json['replacements'] as Iterable)
            .map<Replacement>(
              (e) => Replacement.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        offset: json['offset'] as int,
        length: json['length'] as int,
        context: Context.fromJson(json['context'] as Map<String, dynamic>),
        sentence: json['sentence'] as String,
        type: Type.fromJson(json['type'] as Map<String, dynamic>),
        rule: Rule.fromJson(json['rule'] as Map<String, dynamic>),
        ignoreForIncompleteSentence:
            json['ignoreForIncompleteSentence'] as bool,
        contextForSureMatch: json['contextForSureMatch'] as int,
      );

  String message;
  String shortMessage;
  List<Replacement> replacements;
  int offset;
  int length;
  Context context;
  String sentence;
  Type type;
  Rule rule;
  bool ignoreForIncompleteSentence;
  int contextForSureMatch;

  Map<String, dynamic> toJson() => {
        'message': message,
        'shortMessage': shortMessage,
        'replacements': List<dynamic>.from(replacements.map((x) => x.toJson())),
        'offset': offset,
        'length': length,
        'context': context.toJson(),
        'sentence': sentence,
        'type': type.toJson(),
        'rule': rule.toJson(),
        'ignoreForIncompleteSentence': ignoreForIncompleteSentence,
        'contextForSureMatch': contextForSureMatch,
      };
}

class Context {
  Context({
    required this.text,
    required this.offset,
    required this.length,
  });

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        text: json['text'] as String,
        offset: json['offset'] as int,
        length: json['length'] as int,
      );

  String text;
  int offset;
  int length;

  Map<String, dynamic> toJson() => {
        'text': text,
        'offset': offset,
        'length': length,
      };
}

class Replacement {
  Replacement({
    required this.value,
  });
  factory Replacement.fromJson(Map<String, dynamic> json) => Replacement(
        value: json['value'] as String,
      );

  String value;

  Map<String, dynamic> toJson() => {
        'value': value,
      };
}

class Rule {
  Rule({
    required this.id,
    required this.description,
    required this.issueType,
    required this.category,
    required this.isPremium,
  });
  factory Rule.fromJson(Map<String, dynamic> json) => Rule(
        id: json['id'] as String,
        description: json['description'] as String,
        issueType: json['issueType'] as String,
        category: Category.fromJson(json['category'] as Map<String, dynamic>),
        isPremium: json['isPremium'] as bool,
      );

  String id;
  String description;
  String issueType;
  Category category;
  bool isPremium;

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'issueType': issueType,
        'category': category.toJson(),
        'isPremium': isPremium,
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as String,
        name: json['name'] as String,
      );

  String id;
  String name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class Type {
  Type({
    required this.typeName,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        typeName: json['typeName'] as String,
      );

  String typeName;

  Map<String, dynamic> toJson() => {
        'typeName': typeName,
      };
}

class Software {
  Software({
    required this.name,
    required this.version,
    required this.buildDate,
    required this.apiVersion,
    required this.premium,
    required this.premiumHint,
    required this.status,
  });

  factory Software.fromJson(Map<String, dynamic> json) => Software(
        name: json['name'] as String,
        version: json['version'] as String,
        buildDate: json['buildDate'] as String,
        apiVersion: json['apiVersion'] as int,
        premium: json['premium'] as bool,
        premiumHint: json['premiumHint'] as String,
        status: json['status'] as String,
      );

  String name;
  String version;
  String buildDate;
  int apiVersion;
  bool premium;
  String premiumHint;
  String status;

  Map<String, dynamic> toJson() => {
        'name': name,
        'version': version,
        'buildDate': buildDate,
        'apiVersion': apiVersion,
        'premium': premium,
        'premiumHint': premiumHint,
        'status': status,
      };
}

class Warnings {
  Warnings({
    required this.incompleteResults,
  });
  factory Warnings.fromJson(Map<String, dynamic> json) => Warnings(
        incompleteResults: json['incompleteResults'] as bool,
      );

  bool incompleteResults;

  Map<String, dynamic> toJson() => {
        'incompleteResults': incompleteResults,
      };
}
