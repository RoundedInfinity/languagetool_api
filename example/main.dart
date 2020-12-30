import 'package:language_tool/language_tool.dart';

void main() async {
  var tool = LanguageTool();

  var result = await tool.check(
    'Im a good boy that is super cool and hapy',
  );
  for (var mistake in result) {
    print(
        'Issue: ${mistake.issueDescription} positioned at: ${mistake.offset} with the lengh of ${mistake.length}. Possible corrections: ${mistake.replacements}');
  }
}
