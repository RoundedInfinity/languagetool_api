# LanguageTool API

Dart library for checking text for grammar and spelling mistakes using the [LanguageTool API.](https://languagetool.org)

[![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://pub.dev/packages/effective_dart) [![CodeFactor](https://www.codefactor.io/repository/github/roundedinfinity/languagetool_api/badge)](https://www.codefactor.io/repository/github/roundedinfinity/languagetool_api)

## 🚀 Features

**Check for**...

- ...spelling mistakes
- ...grammatical mistakes
- ...logical mistakes

The free version has 20 requests per minute.

You can currently only use the free version of this API that does not require an API key.

## 🧪 Usage

Use the `LanguageTool` Object to check your text with the _LanguageTool API_.

```dart
final tool = LanguageTool();

final result = await tool.check('what happened at 5 PM on Monday, 27 May 2007?')

result.forEach(print);
// This prints 3 mistakes.
// 1. This sentence does not start with an uppercase letter.
// 2. Using PM and afternoon together is redundant.
// 3. The date 27 May 2007 is not a Monday, but a Sunday.
```

To get all available languages, call `LanguageTool.languages`.

You can find a more advanced example in the example tab.
