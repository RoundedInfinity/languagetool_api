import 'package:http/http.dart' as http;

import 'data/awnser.dart';
import 'data/writing_mistake.dart';

class LanguageTool {
  /// If set to [picky], additional rules will be activated,
  ///  i.e. rules that you might only find useful when checking formal text.
  bool picky = false;

  /// A language code like en-US,
  /// de-DE, fr, or __auto__ to guess the anguage automatically.
  ///
  /// For languages with variants (English, German, Portuguese)
  /// spell checking will only be activated
  /// when you specify the variant, e.g. en-GB instead of just en.
  String language = 'auto';

  final _headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json',
  };

  /// Check a text with LanguageTool for possible style and grammar issues.
  ///
  ///
  Future<List<WritingMistake>> check(String text) async {
    var res = await http.post(
      'https://api.languagetoolplus.com/v2/check',
      headers: _headers,
      body: _formatDataArgument(text),
    );

    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }

    final languageToolAwnser = languageToolAwnserFromJson(res.body);
    return _parseWriteings(languageToolAwnser);
  }

  String _formatDataArgument(String uncheckedText) {
    var level = picky ? 'picky' : 'default';
    var text = uncheckedText.replaceAll(' ', '%20');

    return 'text=$text&language=$language&enabledOnly=false&level=$level';
  }

  List<WritingMistake> _parseWriteings(
      LanguageToolAwnserRaw languageToolAwnser) {
    var result = <WritingMistake>[];
    for (var match in languageToolAwnser.matches) {
      var replacements = <String>[];
      for (var item in match.replacements) {
        replacements.add(item.value);
      }

      result.add(
        WritingMistake(
          issueDescription: match.rule.description,
          issueType: match.rule.issueType,
          length: match.length,
          offset: match.offset,
          replacements: replacements,
        ),
      );
    }
    return result;
  }
}
