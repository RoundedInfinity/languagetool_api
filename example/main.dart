import 'package:language_tool/language_tool.dart';

void main() async {
  var tool = LanguageTool();

  var result = await tool.check(
    'Im a good boy that is super cool and hapy',
  );
  for (var mistake in result) {
    sentence = sentence.replaceRange(
      mistake.offset + addedChars,
      mistake.offset + mistake.length + addedChars,
      red +
          sentence.substring(mistake.offset + addedChars,
              mistake.offset + mistake.length + addedChars) +
          reset,
    );
    addedChars += 9;
  }

  print(sentence);
}
