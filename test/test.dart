import 'package:language_tool/language_tool.dart';
import 'package:test/test.dart';

void main() {
  group('Checking', () {
    test('Simple check', () async {
      var tool = LanguageTool();

      var result = await tool.check('Hello theer');
      expect(result.length, 1);
      expect(result.first.replacements.first, 'there');
    });

    test('No mistakes ', () async {
      var tool = LanguageTool();

      var result = await tool.check('Hello there');
      expect(result, isEmpty);
    });

    test('Language test', () async {
      var werkzeug = LanguageTool(language: 'de-DE');
      var outil = LanguageTool(language: 'fr');

      var resultDe = await werkzeug.check('Guten tag wie geht es dir?');
      var resultFr = await outil.check('Bonjour monsieu');
      expect(resultDe.length, 1);
      expect(resultFr.length, 1);
    });

    test('Auto detected Language', () async {
      var tool = LanguageTool();
      var resultEn = await tool.check('This is a english sentences');
      var resultDe = await tool.check('Dieses Satz ist falsch');

      expect(resultEn.first.issueType, 'misspelling');
      expect(resultDe.length, 1);
    });
  });
}
