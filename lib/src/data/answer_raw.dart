// To parse this JSON data, do
//
//     final languageToolAnswr = languageToolAnswerFromJson(jsonString);
// ignore_for_file: public_member_api_docs
import 'dart:convert';

LanguageToolAnswerRaw languageToolAnswerFromJson(String str) =>
    LanguageToolAnswerRaw.fromJson(json.decode(str));

String languageToolAnswerToJson(LanguageToolAnswerRaw data) =>
    json.encode(data.toJson());

class LanguageToolAnswerRaw {
  LanguageToolAnswerRaw({
    required this.software,
    required this.warnings,
    required this.language,
    required this.matches,
  });

  Software software;
  Warnings warnings;
  Language language;
  List<Match> matches;

  factory LanguageToolAnswerRaw.fromJson(Map<String, dynamic> json) =>
      LanguageToolAnswerRaw(
        software: Software.fromJson(json['software']),
        warnings: Warnings.fromJson(json['warnings']),
        language: Language.fromJson(json['language']),
        matches: json['matches'].map<Match>(Match.fromJson).toList(),
      );

  Map<String, dynamic> toJson() => {
        'software': software.toJson(),
        'warnings': warnings.toJson(),
        'language': language.toJson(),
        'matches': List<dynamic>.from(matches.map((x) => x.toJson())),
      };
}

class Language {
  Language({
    required this.name,
    required this.code,
    required this.detectedLanguage,
  });

  String name;
  String code;
  DetectedLanguage detectedLanguage;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json['name'],
        code: json['code'],
        detectedLanguage: DetectedLanguage.fromJson(json['detectedLanguage']),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'detectedLanguage': detectedLanguage.toJson(),
      };
}

class DetectedLanguage {
  DetectedLanguage({
    required this.name,
    required this.code,
    required this.confidence,
  });

  String name;
  String code;
  double confidence;

  factory DetectedLanguage.fromJson(Map<String, dynamic> json) =>
      DetectedLanguage(
        name: json['name'],
        code: json['code'],
        confidence: json['confidence'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'confidence': confidence,
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

  factory Match.fromJson(dynamic json) => Match(
        message: json['message'],
        shortMessage: json['shortMessage'],
        replacements: json['replacements']
            .map<Replacement>(Replacement.fromJson)
            .toList(),
        offset: json['offset'],
        length: json['length'],
        context: Context.fromJson(json['context']),
        sentence: json['sentence'],
        type: Type.fromJson(json['type']),
        rule: Rule.fromJson(json['rule']),
        ignoreForIncompleteSentence: json['ignoreForIncompleteSentence'],
        contextForSureMatch: json['contextForSureMatch'],
      );

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

  String text;
  int offset;
  int length;

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        text: json['text'],
        offset: json['offset'],
        length: json['length'],
      );

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

  String value;

  factory Replacement.fromJson(dynamic json) => Replacement(
        value: json['value'],
      );

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

  String id;
  String description;
  String issueType;
  Category category;
  bool isPremium;

  factory Rule.fromJson(Map<String, dynamic> json) => Rule(
        id: json['id'],
        description: json['description'],
        issueType: json['issueType'],
        category: Category.fromJson(json['category']),
        isPremium: json['isPremium'],
      );

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

  String id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class Type {
  Type({
    required this.typeName,
  });

  String typeName;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        typeName: json['typeName'],
      );

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

  String name;
  String version;
  String buildDate;
  int apiVersion;
  bool premium;
  String premiumHint;
  String status;

  factory Software.fromJson(Map<String, dynamic> json) => Software(
        name: json['name'],
        version: json['version'],
        buildDate: json['buildDate'],
        apiVersion: json['apiVersion'],
        premium: json['premium'],
        premiumHint: json['premiumHint'],
        status: json['status'],
      );

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

  bool incompleteResults;

  factory Warnings.fromJson(Map<String, dynamic> json) => Warnings(
        incompleteResults: json['incompleteResults'],
      );

  Map<String, dynamic> toJson() => {
        'incompleteResults': incompleteResults,
      };
}
