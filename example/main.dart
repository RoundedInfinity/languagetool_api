// ignore_for_file: avoid_print

import 'package:language_tool/language_tool.dart';

void main() async {
  final tool = LanguageTool();

  final badSentences = [
    'Flutetr is Google’s UI toolkti for building beatuiful applicatoins',
    'what happened at 5 PM in the afternoon on Monday, 27 May 2007?'
  ];

  // Works for spelling mistakes.
  var result = await tool.check(badSentences[0]);

  markMistakes(result, badSentences[0]);

  // Logic check.
  result = await tool.check(badSentences[1]);
  printDetails(result);
}

///Prints every property for every [WritingMistake] passed.
void printDetails(List<WritingMistake> result) {
  for (final mistake in result) {
    print('''
        Issue: ${mistake.message}
        IssueType: ${mistake.issueDescription}
        positioned at: ${mistake.offset}
        with the length of ${mistake.length}.
        Possible corrections: ${mistake.replacements}
    ''');
  }
}

/// prints the given [sentence] with all mistakes marked red.
void markMistakes(List<WritingMistake> result, String sentence) {
  var text = sentence;
  // Color codes for the terminal.
  const red = '\u001b[31m';
  const reset = '\u001b[0m';

  var addedChars = 0;

  for (final mistake in result) {
    text = text.replaceRange(
      mistake.offset + addedChars,
      mistake.offset + mistake.length + addedChars,
      red +
          text.substring(
            mistake.offset + addedChars,
            mistake.offset + mistake.length + addedChars,
          ) +
          reset,
    );
    addedChars += 9;
  }

  print(text);
}
