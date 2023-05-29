import 'package:language_tool/language_tool.dart';
import 'package:test/test.dart';

void main() {
  group('Checking', () {
    test('Simple check', () async {
      final tool = LanguageTool();

      final result = await tool.check('Hello theer');
      expect(result.length, 1);
      expect(result.first.replacements.first, 'their');
    });

    test('No mistakes ', () async {
      final tool = LanguageTool();

      final result = await tool.check('Hello there');
      expect(result, isEmpty);
    });

    test('Language test', () async {
      final werkzeug = LanguageTool(language: 'de-DE');
      final outil = LanguageTool(language: 'fr');

      final resultDe = await werkzeug.check('Guten tag wie geht es dir?');
      final resultFr = await outil.check('Bonjour monsieu');
      expect(resultDe.length, 2);
      expect(resultFr.length, 1);
    });

    test('Auto detected Language', () async {
      final tool = LanguageTool();
      final resultEn = await tool.check('This is a english sentences');
      final resultDe = await tool.check('Dieses Satz ist falsch');

      expect(resultEn.first.issueType, 'misspelling');
      expect(resultDe.length, 1);
    });

    test('List Languages', () async {
      final tool = LanguageTool();
      final languages = await tool.languages();

      expect(languages, isNotEmpty);
    });
  });
}
