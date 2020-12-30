import 'package:http/http.dart' as http;

import 'data/awnser.dart';
import 'data/writing_mistake.dart';

class LanguageTool {
  bool picky = false;

  final _headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json',
  };

  Future<List<WritingMistake>> check(String text) async {
    print(formatDataArgument(text));
    var res = await http.post(
      'https://api.languagetoolplus.com/v2/check',
      headers: _headers,
      body: formatDataArgument(text),
    );

    if (res.statusCode != 200) {
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    }

    final languageToolAwnser = languageToolAwnserFromJson(res.body);
    return _parseWriteings(languageToolAwnser);
  }

  String formatDataArgument(String uncheckedText) {
    var level = picky ? 'picky' : 'default';
    var text = uncheckedText.replaceAll(' ', '%20');
    return 'text=$text&language=en-US&enabledOnly=false&level=$level';
  }

  List<WritingMistake> _parseWriteings(
      LanguageToolAwnserRaw languageToolAwnser) {
    var result = <WritingMistake>[];
    for (var match in languageToolAwnser.matches) {
      var replacements = <String>[];
      match.replacements.forEach((element) => replacements.add(element.value));
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
