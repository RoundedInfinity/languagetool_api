/// An object that contains information about a language.
class Language {
  /// An object that contains information about a language.
  Language({
    required this.name,
    required this.code,
    this.longCode,
    this.detectedLanguage,
  });

  /// {@template doc_fromjson}
  /// Creates this object from a json Map.
  /// {@endtemplate}
  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json['name'] as String,
        code: json['code'] as String,
        longCode: json['longCode'] as String?,
        detectedLanguage: json.containsKey('detectedLanguage')
            ? DetectedLanguage?.fromJson(
                json['detectedLanguage'] as Map<String, dynamic>,
              )
            : null,
      );

  /// A language name like 'French' or 'English (Australia)'
  final String name;

  /// A language code like 'en' ,
  final String code;

  /// A language code like 'en-US' or 'ca-ES-valencia'
  final String? longCode;

  /// The automatically detected text language
  ///  (might be different from the language actually used for checking).
  ///
  /// Will always be `null` when using the `languages` function.
  final DetectedLanguage? detectedLanguage;

  /// {@template doc_tojson}
  /// Converts this object into a json Map.
  /// {@endtemplate}
  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'longCode': longCode,
        'detectedLanguage': detectedLanguage?.toJson(),
      };

  /// {@template doc_copywith}
  ///  Copies the object with the specified values changed.
  /// {@endtemplate}
  Language copyWith({
    String? name,
    String? code,
    String? longCode,
    DetectedLanguage? detectedLanguage,
  }) {
    return Language(
      name: name ?? this.name,
      code: code ?? this.code,
      longCode: longCode ?? this.longCode,
      detectedLanguage: detectedLanguage ?? this.detectedLanguage,
    );
  }

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'Language(name: $name, code: $code, longCode: $longCode, detectedLanguage: $detectedLanguage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Language &&
        other.name == name &&
        other.code == code &&
        other.longCode == longCode &&
        other.detectedLanguage == detectedLanguage;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        code.hashCode ^
        longCode.hashCode ^
        detectedLanguage.hashCode;
  }
}

/// The automatically detected text language.
class DetectedLanguage {
  /// The automatically detected text language.
  DetectedLanguage({
    required this.name,
    required this.code,
    required this.confidence,
  });

  /// {@macro doc_fromjson}
  factory DetectedLanguage.fromJson(Map<String, dynamic> json) =>
      DetectedLanguage(
        name: json['name'] as String,
        code: json['code'] as String,
        confidence: (json['confidence'] as num).toDouble(),
      );

  /// Language name like 'French' or 'English (US)'.
  final String name;

  /// ISO 639-1 code like 'en', 'en-US', or 'ca-ES-valencia'.
  final String code;

  /// How confident this language was chosen.
  final double confidence;

  /// {@macro doc_tojson}
  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'confidence': confidence,
      };

  /// {@macro doc_copywith}
  DetectedLanguage copyWith({
    String? name,
    String? code,
    double? confidence,
  }) {
    return DetectedLanguage(
      name: name ?? this.name,
      code: code ?? this.code,
      confidence: confidence ?? this.confidence,
    );
  }
}
