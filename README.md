# LanguageTool API

Dart library for checking text for grammar and spelling mistakes using the [languageTool API.](https://languagetool.org)

[![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://pub.dev/packages/effective_dart)

## Features 

- check for spelling mistakes
- check for grammatical mistakes
-  20 requests per minute:

## Usage

Use the `LanguageTool` Object to check your text with the _LanguageTool API_. You can currently only use the free version of this API that does not require an API key.

First, import this package.

```dart
import 'package:language_tool/language_tool.dart';
```

Now instantiate `LanguageTool` and use it in an `async` function.

```dart
var tool = LanguageTool();

var result = tool.check('what happened at 5 PM on Monday, 27 May 2007?')

result.forEach(print);
// This will print 2 mistakes.
// 1. No uppercase letter.
// 2. 27 May 2007 wasn't a monday.
```

