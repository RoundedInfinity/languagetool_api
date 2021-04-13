import 'package:language_tool/language_tool.dart';

void main() async {
  var tool = LanguageTool();

  var badSentences = [
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
  for (var mistake in result) {
    print('''
        Issue: ${mistake.message}
        IssueType: ${mistake.issueDescription}
        positioned at: ${mistake.offset}
        with the lengh of ${mistake.length}.
        Possible corrections: ${mistake.replacements}
    ''');
  }
}

/// prints the given [sentence] with all mistakes marked red.
void markMistakes(List<WritingMistake> result, String sentence) {
  var red = '\u001b[31m';
  var reset = '\u001b[0m';

  var addedChars = 0;

  for (var mistake in result) {
    sentence = sentence.replaceRange(
      mistake.offset! + addedChars,
      mistake.offset! + mistake.length! + addedChars,
      red +
          sentence.substring(mistake.offset! + addedChars,
              mistake.offset! + mistake.length! + addedChars) +
          reset,
    );
    addedChars += 9;
  }

  print(sentence);
}
