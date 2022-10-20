/// Object that stores information about a single writing mistake.
class WritingMistake {
  /// Position of the beginning of the mistake.
  final int offset;

  /// Length of the mistake after the offset.
  final int length;

  /// The type of mistake.
  final String issueType;

  /// Description of the [issueType].
  final String issueDescription;

  /// A brief description of the mistake.
  final String message;

  /// A list of suggestions for replacing the mistake.
  ///
  /// Sortet by probability.
  final List<String> replacements;

  /// Object that stores information about a single writing mistake.
  WritingMistake({
    required this.message,
    required this.offset,
    required this.length,
    required this.issueType,
    required this.issueDescription,
    required this.replacements,
  });

  /// Copies the object with the specified values changed.
  WritingMistake copyWith({
    required int offset,
    required int length,
    required String issueType,
    required String issueDescription,
    required String message,
    required List<String> replacements,
  }) {
    return WritingMistake(
      offset: offset,
      length: length,
      issueType: issueType,
      issueDescription: issueDescription,
      message: message,
      replacements: replacements,
    );
  }

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'WritingMistake(offset: $offset, length: $length, issueType: $issueType, issueDescription: $issueDescription, message: $message, replacements: $replacements)';
  }
}
