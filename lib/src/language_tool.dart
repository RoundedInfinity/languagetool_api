import 'package:http/http.dart' as http;

import 'data/awnser_raw.dart';
import 'data/writing_mistake.dart';

/// Objects of this class are used to interact with the LanguageTool API.
class LanguageTool {
  /// If set to [picky], additional rules will be activated,
  /// i.e. rules that you might only find useful when checking formal text.
  final bool picky;

  /// A language code like en-US,
  /// de-DE, fr, or __auto__ to guess the anguage automatically.
  ///
  /// For languages with variants (English, German, Portuguese)
  /// spell checking will only be activated
  /// when you specify the variant, e.g. en-GB instead of just en.
  final String language;

  /// Onject to interact with the LanguageTool API.
  ///
  /// Use `check` to check text for spelling and grammar mistakes.
  ///
  /// Currently only available with the free version.
  LanguageTool({
    this.picky = false,
    this.language = 'auto',
  });

  final _headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json',
  };

  /// Check a text with LanguageTool for possible style and grammar issues.
  ///
  /// If no mistake were found, this returns an emtpy list
  Future<List<WritingMistake>> check(String text) async {
    var languageToolUri = Uri.https("api.languagetoolplus.com", "v2/check");
    var res = await http.post(
      languageToolUri,
      // 'https://api.languagetoolplus.com/v2/check',
      headers: _headers,
      body: _formatDataArgument(text),
    );

    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }

    final languageToolAwnser = languageToolAwnserFromJson(res.body);
    return parseWritings(languageToolAwnser);
  }

  String _formatDataArgument(String uncheckedText) {
    var level = picky ? 'picky' : 'default';
    var text = uncheckedText.replaceAll(' ', '%20');

    return 'text=$text&language=$language&enabledOnly=false&level=$level';
  }

  /// Converts a [LanguageToolAwnserRaw] in a  [WritingMistake].
  List<WritingMistake> parseWritings(LanguageToolAwnserRaw languageToolAwnser) {
    var result = <WritingMistake>[];

    for (var match in languageToolAwnser.matches!) {
      var replacements = <String?>[];
      for (var item in match.replacements!) {
        replacements.add(item.value);
      }

      result.add(
        WritingMistake(
            issueDescription: match.rule!.description,
            issueType: match.rule!.issueType,
            length: match.length,
            offset: match.offset,
            replacements: replacements,
            message: match.message),
      );
    }
    return result;
  }
}
